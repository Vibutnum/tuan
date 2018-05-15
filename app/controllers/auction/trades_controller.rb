class Auction::TradesController < Auction::ApplicationController
  include NewYear
  
  layout :site_layout

  # current_user  是 Auction::User 实例
  # @current_user 是 Core::User 实例
  # 用户订单列表
  def index
    @q = @current_user.trades.preload(:coupon, group_trade: :group, units: { item: :product }).joins("LEFT JOIN `groupon_coupons` ON `auction_trades`.`coupon_id` = `groupon_coupons`.`id`").active.where(client: 'uxuan').where({ groupon_coupons: { is_redpack: false } }).order('id DESC').ransack(params[:q])
    @trades = @q.result.paginate page: params[:page]
    
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def new
    @coupon  = Groupon::Coupon.find(params[:coupon_id])
    @contact = Auction::Contact.find(params[:contact_id]) if params[:contact_id].present?

    @user = current_user
    @query_str = params.slice(:coupon_id, :ungrouped, :trade, :contact_id, :location_id)

    if @user.ordered_contacts.present?
      @contact ||= @user.ordered_contacts.first
      @query_str = @query_str.merge({contact_id: @contact.id}).to_query
    else
      @query_str = @query_str.to_query
      redirect_to "/auction/contacts/new?#{ @query_str }"
    end
  end

  def show
    @trade   = @current_user.trades.joins("LEFT JOIN `groupon_coupons` ON `auction_trades`.`coupon_id` = `groupon_coupons`.`id`").active.where(client: 'uxuan').find(params[:id])
  end
  
  # 只能在/auction/trades/路由下发起支付，所以 gift_trades_controller#show放到了这边
  def gift_show
    @trade = @current_user.trades.active.where(client: 'gift').find(params[:trade_id])
    render 'auction/trades/gift_show'
  end

  ##
  # == 创建
  #
  # === Request
  #
  # ==== Resource
  #
  # POST /auction/trades
  #
  # ==== Parameters

  # \coupon_id :: 拼货ID
  # \ungrouped :: 是否单独购买，1为单独购买
  # \trade[contact][id] :: 联系方式ID，如果用户沿用上次联系方式则只传id
  # \trade[contact][name] :: 姓名
  # \trade[contact][country] :: 国家
  # \trade[contact][province] :: 身份
  # \trade[contact][city] :: 城市
  # \trade[contact][town] :: 区县
  # \trade[contact][address] :: 地址
  # \trade[contact][postcode] :: 邮编
  # \trade[contact][phone] :: 电话
  # \trade[contact][mobile] :: 手机
  # \trade[contact][id_number] :: 身份证号  
  # \trade[client] :: 客户端类型, 此处为uxuan（必须为 %w[manage html5 osx windows linux flash iphone ipad android phone_web ipad_web wechat uxuan] 之一）
  # === Response
  #
  # 返回一条Auction::Trade
  #
  def create
    @error_msg = nil
    
    begin
      ActiveRecord::Base.transaction do
        if group_id = params[:trade].fetch(:group_id, nil)
          group = Groupon::Group.find group_id
          
          raise '这个团已经不能参加了' unless group.can_join?
          
          raise "无效的团" if group.coupon.is_redpack?
        end
        
        @user = current_user
        coupon   = Groupon::Coupon.find(params[:coupon_id])
        # 红包商品抛异常
        raise "无效的团购商品" if coupon.is_redpack?
        unless params[:ungrouped].present?
          raise '此团购不允许重复购买' if (!coupon.rebuy_allowed? && Auction::Trade.where(coupon_id: coupon.id, user_id: @user.id).where('payment_identifier is not null').exists?)
        end
        
        @trade = Auction::Trade.create!(status: 'pay', checkout_token: SecureRandom.hex(16))
        
        @trade.units = if params[:coupon_id]
          product  = coupon.product
          order_by = Auction::Category::PRIORITIES.map{ |p| {p[:name] => p[:order]} }.inject({}, &:merge)[product.category2 && product.category2.priority] || (Auction::Category::PRIORITIES.first||{})[:order]
          item     = product.items.published.unsold.order(order_by).first
          # item     = product.items.published.order(order_by).first
          
          # 有效性
          raise '无效的团购商品' unless coupon.published? && product.published?
          if coupon_id = params[:trade].fetch(:coupon_id, nil)
            raise '无效的团购商品' unless params[:coupon_id].to_i === coupon_id.to_i
          end
          # 卖场权限
          raise '无效的卖场权限' unless (@user.malls + (@user.level ? @user.level.malls : [])).include?(product.mall)
          # 库存判断
          raise '库存不足' unless item.present?  
          
          price = params[:ungrouped].present? ? coupon.price : coupon.discount
          raise '购买价格不能低于商品的最低价格' unless price >= product.minimum_price.to_i     
          
          item.update_attributes!(trade_id: @trade.id)
          
          unit = Auction::Unit.new(
                          trade_id: @trade.id,
                          item_id: item.id,
                          percent: 0,
                          point_percent: 0,
                          level_percent: 0,
                          discount: product.discount,
                          price: price,
                          mall_id: product.mall_id,
                          category1_id: product.category1_id,
                          category2_id: product.category2_id,
                          target: product.target,
                          label: product.label,
                          prefix: product.prefix,
                          location_id: product.location_id,
                          tax_rate: product.tax_rate,
                          foreign_payment: product.foreign_payment,
                        )
          product.sync_sell_data!
          [unit]
        end
        
        raise '无效的库存单元' if @trade.units.blank?
      
        # decrypt params with leading string 'Ns5Y'
        if params[:trade]
          %w[delivery_time delivery_phone invoice_type invoice_title invoice_content comment package_from package_to package_content whisper_style whisper_from whisper_to whisper_content is_present].each{ |field| (v = params[:trade][field]) && v.match(/^Ns5Y/) && (params[:trade][field] = Base64.decode64(v.sub(/^Ns5Y/,'')).force_encoding('utf-8')) }
          %w[id name country province city town address postcode phone mobile id_number].each{ |field| (v = params[:trade][:contact][field]) && v.match(/^Ns5Y/) && (params[:trade][:contact][field] = Base64.decode64(v.sub(/^Ns5Y/,'')).force_encoding('utf-8')) } if params[:trade][:contact]
          %w[id name country province city town address postcode phone mobile id_number].each{ |field| (v = params[:trade][:invoice_contact][field]) && v.match(/^Ns5Y/) && (params[:trade][:invoice_contact][field] = Base64.decode64(v.sub(/^Ns5Y/,'')).force_encoding('utf-8')) } if params[:trade][:invoice_contact]
        end
      
        # use last contact or create new if data changed
        if params[:trade] && params[:trade][:contact]
          @contact = (id = params[:trade][:contact][:id]) && !id.empty? && (Auction::Contact.find(id) rescue nil)
        end

        raise '无效的地址' unless @contact.present?
      
        # # create new invoice contact or use invoice contact
        # if params[:trade] && params[:trade][:invoice_contact]
        #   params[:trade][:invoice_contact][:id] = @contact.id if params[:trade][:invoice_contact][:id].blank?
        #   @invoice_contact = (id = params[:trade][:invoice_contact][:id]) && !id.blank? && (Contact.acquire(id) rescue nil)
        #   @invoice_contact = nil if @invoice_contact && !%w[name country province city town address postcode phone mobile].map{|f| @invoice_contact[f] == params[:trade][:invoice_contact][f] }.inject(&:&)
        #   @invoice_contact ||= Auction::Contact.find_by(invoice_contact_params.slice('name', 'country', 'province', 'city', 'town', 'address', 'postcode', 'phone', 'mobile').merge(user_id: @user.id))
        #   @invoice_contact ||= Auction::Contact.create!(invoice_contact_params.merge(:user_id => @user.id))
        # end
      
        # 运费
        delivery_price = (price < 200 && params[:ungrouped].present? ) ? 20 : 0

        payment_price  = @trade.units.map(&:price).inject(&:+)

        # 实际支付金额
        payment_price += delivery_price

        # 税费
        tax_price = (coupon.product.discount * coupon.product.tax_rate.to_f).round
        tax_price = 0 if tax_price <= 50 || coupon.product.location_id.to_i <= 1
        payment_price += tax_price

        # update trade information
        @trade.update_attributes!({
          delivery_price: delivery_price,
          user_id: @user.try(:id),
          contact_id: @contact.try(:id),
          location_id: @trade.units[0].item.product.location_id,
          # invoice_contact_id: @invoice_contact.try(:id),
          price: price.to_i,
          balance_price: 0,  
          payment_price: payment_price.to_i,
          tax_price: tax_price,
          status: 'pay',
          identifier: '%04d%02d%02d%02d%04d%06s' % [Time.now.year, Time.now.month, Time.now.day, ((@trade.units[0].item.product.category2_id||0) % 100), (@trade.units[0].item.product_id % 10000), ((0..9).to_a*3+('A'..'Z').to_a).shuffle[0..5].join],
          client: 'uxuan',
        }.merge( params[:ungrouped].present? ? {} : (params[:trade]||{}).slice(:group_id, :coupon_id))
         .merge(cookies.instance_variable_get('@cookies').slice(*%w[link_id click_id latest_link_id latest_click_id])))
      
        @trade.updatings.create!(status: @trade.status)
      end
    rescue => e
      Rails.logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
      @error_msg = e.message
    end
    
    if @error_msg.nil?
      respond_to do |format|
        format.html { redirect_to(params[:redirect] || auction_trade_path(@trade)) }
        format.json { render json: { trade: @trade } }
      end
    else
      respond_to do |format|
        format.html { redirect_to(request.referer || auction_trade_path(@trade)) }
        format.json { render json: { error: @error_msg } }
      end
    end
    
  end

  ##
  # == 取消交易
  #
  # === Request
  #
  # ==== Resource
  #
  # PUT /auction/trades/:id/cancel
  #
  # ==== Parameters
  #
  # id :: 交易ID
  #
  # === Response
  #
  # 返回一条Auction::Trade
  #
  def cancel
    @trade = Auction::Trade.find(params[:id])

    if @trade.user_id != current_user.try(:id) || @trade.status != 'pay'
      not_authorized
      return
    end

    @success = database_transaction do
      @trade.update_attributes!(:status => 'cancel')
      @trade.updatings.create!(status: @trade.status)
      if params[:from] == "uxuan_gift"
        if @trade.is_gift_parent?
          @trade.gift_children.each{ |child| child.units.each(&:returnit!) }
        elsif @trade.is_reward?
          @trade.units.each(&:returnit!)
        end
      else
        @trade.units.each(&:returnit!)
      end
    end

    respond_to do |format|
      if @success
        format.html do
          params[:from] == "uxuan_gift" ? redirect_to(gift_show_auction_trades_path(trade_id: @trade.id)) : redirect_to(params[:redirect] || auction_trade_path(@trade))
        end
      else
        format.html do
          params[:from] == "uxuan_gift" ? redirect_to(gift_show_auction_trades_path(trade_id: @trade.id)) : redirect_to(request.referer || auction_trade_path(@trade))
        end
      end
    end
  end

  ##
  # == 外部支付页面
  #
  # === Request
  #
  # ==== Resource
  #
  # GET /auction/trades/:id/checkout
  #
  # ==== Parameters
  #
  # id :: 交易ID
  # \trade[checkout_token] :: 付款令牌(他人代付时生效)
  # \trade[payment_service] :: 付款服务，可以为%w[alipay alipay_qr alipay_网银代码 alipay_moto alipay_creditcard_快捷代码 alipay_installment alipay_installment_分期代码 alipay_forex alipay_forex_wap alipay_forex_wallet(仅适用于海外购) bill99 bill99_银行代码 unionpay lakala cmbchina cmbchina_wap ccb cmbc pab pgs boc_creditcard boc alipay_wap unionpay_wap comm_creditcard yeepay yeepay_预付卡代码 cmbchina_creditcard_分期代码 wechat pab_pay tenpay tenpay_财付通银行代码]之一，银行代码列表请见Auction::Trade
  # redirect :: 跳转地址（仅限于cmbchina cmbchina_wap）
  # coupon_id :: 
  # group_id ::
  # === Response
  #
  # ==== HTML
  #
  # 重定向到付款页面
  #
  # ==== JSON
  #
  #   {
  #     "url" : 地址,
  #   }
  #
  # def checkout
  #   @trade = Auction::Trade.find(params[:id])

  #   # 无效的海外支付方式
  #   # service = params[:trade] && params[:trade][:payment_service]
  #   # raise "invalid payment_service" unless service == 'wechat_uxuan'

  #   # 此订单无法支付
  #   raise "already paid" unless @trade.status == 'pay'
    
  #   # 判断团是否合理
  #   if @trade.group_id
  #     group = Groupon::Group.find @trade.group_id
  #     raise 'invalid group' unless group.can_join?
  #   end
    
  #   con = Core::Connection.where(account_id: @trade.user_id).last
    
  #   # 此用户找不到微信授权记录
  #   raise "unauthorized wechat user" unless con && con.identifier.present?
    
  #   respond_to do |format|
  #     format.html { redirect_to params[:redirect] || auction_trade_path(@trade) }
  #     format.json { render json: { 
  #                                  res: @trade.wechat_checkout_url(request.remote_ip, con.identifier), 
  #                                  success_url: wechat_query_auction_trade_url(@trade), 
  #                                  fail_url: auction_trade_url(@trade),
  #                                 } 
  #                 }
  #   end
  # end

  # 支付结果查询
  # \trade[checkout_token] :: 付款令牌(他人代付时生效)
  def wechat_query
    @trade = Auction::Trade.acquire(params[:id])

    wechat_uxuan_query_url = "http://#{DOMAIN_CONFIG['ihaveu']}" + "/auction/trades/" + @trade.id.to_s + "/wechat_uxuan_query.json?trade[checkout_token]=" + @trade.checkout_token.to_s

    res = JSON.parse Timeout::timeout(30){ HTTParty.put( wechat_uxuan_query_url,  
                                                         body: { trade: { checkout_token: @trade.checkout_token } }.to_json,
                                                         header: { 'Content-Type' => 'application/json' },
                                                       )
                                                   .body }
    Rails.logger.debug '-------'*10
    Rails.logger.debug res
                                                  
    # 支付成功时
    if res && res['trade'] && res['trade']['status'] !='pay' && res['trade']['payment_service'] == 'wechat_uxuan'
      
      Rails.logger.debug "----@trade.status #{ @trade.reload.status }---@trade.id #{ @trade.id }----"

      # 如果是团购订单，支付成功后需要开团
      if @trade.coupon_id.present? # 团购订单
        @trade.reload.groupon!   # 需要 reload @trade
      elsif @trade.is_gift_parent? # 送礼订单
        @trade.reload.gift!
        return redirect_to(forward_gift_trade_path(@trade))
      elsif @trade.is_reward? # 犒劳自己
        @trade.delay_for(1.seconds, retry: false).send_notice_for_identification
        return redirect_to(gift_show_auction_trades_path(trade_id: @trade.id))
      elsif @trade.buy_alone?
        @trade.delay_for(1.seconds, retry: false).send_notice_for_identification
      end

      redirect = @trade.group_id ? groupon_group_path(@trade.group_id) : auction_trade_path(@trade)
    else
      # redirect = '/statics/auction/payment/result/failure.html'
      if @trade.is_gift_parent?
        return redirect_to(gift_show_auction_trades_path(trade_id: @trade.id))
      elsif @trade.is_reward?
        return redirect_to(gift_show_auction_trades_path(trade_id: @trade.id))
      else
        redirect = auction_trade_path(@trade)
      end
    end

    respond_to do |format|
      format.html { redirect_to(params[:redirect] || redirect) }
    end
  end
  
  # 犒劳自己
  def closely_gift
    @product = Auction::Product.find params[:product_id]
    
    return redirect_to(request.referer || gift_product_path(@product)) unless params[:count].to_i.between? Auction::Product::MIN_COUNT, Auction::Product::MAX_COUNT
    
    @contact = Auction::Contact.find(params[:contact_id]) if params[:contact_id].present?
    
    @user = current_user
    @query_str = params.slice(:product_id, :contact_id, :count, :location_id)
    
    if @user.ordered_contacts.present?
      @contact ||= @user.ordered_contacts.first
      @query_str = @query_str.merge({contact_id: @contact.id}).to_query
    else
      @query_str = @query_str.to_query
      redirect_to "/gift/contacts/new?#{ @query_str }"
    end
  end

  # GET /auction/trades/:id/requery
  # def requery
  #   @trade = Auction::Trade.acquire(params[:id])
  # end

  ##
  # == 查询微信支付
  #
  # === Request
  #
  # ==== Resource
  #
  # GET /auction/trades/:id/wechat_query
  #
  # ==== Parameters
  #
  # id :: 交易ID
  # redirect :: 跳转地址
  #
  # == Response
  #
  # 跳转页面
  #
  # def wechat_query
  #   @trade = Auction::Trade.acquire(params[:id])    

  #   database_transaction do
  #     @trade.query_wechat!
  #   end

  #   if @trade.status != 'pay'
  #     redirect = if @trade.group_id
  #                   groupon_group_path(@trade.group_id)
  #                else
  #                   auction_trade_path(@trade)
  #                end
  #   else
  #     redirect = '/statics/auction/payment/result/failure.html'
  #   end

  #   respond_to do |format|
  #     format.html { redirect_to params[:redirect] || redirect }
  #   end
  # end
  
  def defray
    @multi = params[:multi].to_s == "1"
    @product = Auction::Product.find params[:product_id]
    @trade = Auction::Trade.new
    @mobile = @current_user.trades.where("giver_mobile IS NOT NULL").order(id: :desc).first.try(:giver_mobile)
  end

  private
  def contact_params
    params.require(:trade).require(:contact).permit(:id, :name, :country, :province, :city, :town, :address, :postcode, :phone, :mobile, :id_number)
  end

  # def invoice_contact_params
  #   params.require(:trade).require(:invoice_contact).permit(:name, :country, :province, :city, :town, :address, :postcode, :phone, :mobile)
  # end
  
  def site_layout
    if params[:action].to_s.in?(gift_actions)
      "gift_application"
    else
      "application"
    end
  end
  
  def gift_actions
    %w{ gift_show closely_gift defray }
  end
end