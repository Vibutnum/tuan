class Gift::TradesController < Gift::ApplicationController
  
  def index
    params[:q] ||= { is_gift_eq: 0 }
    @q = @current_user.trades.active.where(client: 'gift')
    
    if params[:not_empty].present?
      if params[:not_empty] == "0"
        @q = @q.surplus
      elsif params[:not_empty] == "1"
        @q = @q.gotten
      end
    end
    
    @q = @q.includes(units: { item: :product }, gift_children: { units: { item: :product } }, gift_parent: { units: { item: :product } }).order('id DESC').ransack(params[:q])
    
    @trades = @q.result.paginate page: params[:page]
    
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
  
  def show; end
  
  # @params
  #   multi: 1    --> 送给多人
  def new; end
  
  def create
    trade_params = params.require(:auction_trade).permit(:gift_count, :gift_per_count, :gift_remark, :giver_mobile, :client)
    trade_params = {
      gift_count: 1,
      gift_per_count: 1
    }.merge(trade_params.symbolize_keys)
    
    @error_msg = nil
    begin
      ActiveRecord::Base.transaction do
        raise "数量有误" unless trade_params[:gift_count].to_i.between? Auction::Product::MIN_COUNT, Auction::Product::MAX_COUNT
        raise "数量有误" unless trade_params[:gift_per_count].to_i.between? Auction::Product::MIN_COUNT, Auction::Product::MAX_COUNT
        
        check_product params[:product_id], "无效的商品"
        
        product = Auction::Product.find params[:product_id]
        # 有效性
        raise '无效的商品' unless product.published?
        
        @user = current_user
        
        # 卖场权限
        raise '无效的卖场权限' unless (@user.malls + (@user.level ? @user.level.malls : [])).include?(product.mall)
        
        total_items = trade_params[:gift_per_count].to_i * trade_params[:gift_count].to_i
        
        order_by = Auction::Category::PRIORITIES.map{ |p| {p[:name] => p[:order]} }.inject({}, &:merge)[product.category2 && product.category2.priority] || (Auction::Category::PRIORITIES.first||{})[:order]
        
        items = product.items.published.unsold.order(order_by).first(total_items)
        
        # items = product.items.published.order(order_by).first(total_items)
        
        # 库存判断
        raise '库存不足' if items.blank? || items.size != total_items
        
        common_hash = cookies.instance_variable_get('@cookies').slice(*%w[link_id click_id latest_link_id latest_click_id])
        
        price = product.discount.to_i
        
        payment_price = trade_params[:gift_count].to_i * trade_params[:gift_per_count].to_i * price

        raise '订单中包含多件海外商品时，总价格不能超过1000' if product.location_id > 1 && trade_params[:gift_per_count].to_i > 1 && (trade_params[:gift_per_count].to_i * price) > 1000

        # 税费
        tax_price = (product.discount * product.tax_rate.to_f * trade_params[:gift_per_count].to_i).round
        tax_price = 0 if tax_price <= 50 || product.location_id.to_i <= 1
        total_tax_price = tax_price * trade_params[:gift_count].to_i
        payment_price += total_tax_price
        
        @trade = Auction::Trade.create!(trade_params.merge({
            status: 'pay',
            checkout_token: SecureRandom.hex(16),
            guest_token: SecureRandom.hex(16),
            user_id: @user.try(:id),
            location_id: product.location_id,
            balance_price: 0,
            price: price * trade_params[:gift_count].to_i * trade_params[:gift_per_count].to_i,
            payment_price: payment_price,
            tax_price: total_tax_price,
            status: 'pay',
            is_gift: 1,
            identifier: '%04d%02d%02d%02d%04d%06s' % [Time.now.year, Time.now.month, Time.now.day, ((product.category2_id || 0) % 100), (product.id % 10000), ((0..9).to_a*3+('A'..'Z').to_a).shuffle[0..5].join],
            client: 'gift'
          }.merge(common_hash)))
        
        @trade.updatings.create!(status: @trade.status)
        
        raise '价格不能低于商品的最低价格' unless price >= product.minimum_price.to_i
        
        @trade.gift_count.to_i.times.each do |_|
          t = Auction::Trade.create!({
                status: 'pay',
                checkout_token: SecureRandom.hex(16),
                guest_token: SecureRandom.hex(16),
                gift_from: @trade.id,
                location_id: product.location_id,
                balance_price: 0,
                price: price * @trade.gift_per_count,
                payment_price: 0,
                tax_price: tax_price,
                status: 'pay',
                is_gift: 1,
                identifier: '%04d%02d%02d%02d%04d%06s' % [Time.now.year, Time.now.month, Time.now.day, ((product.category2_id || 0) % 100), (product.id % 10000), ((0..9).to_a*3+('A'..'Z').to_a).shuffle[0..5].join],
                client: 'gift'
              }.merge(common_hash))
          t.updatings.create!(status: t.status)
        end
        
        @trade.gift_children.each do |child|
          product.items.published.unsold.order(order_by).first(@trade.gift_per_count).each do |item|
            item.update_attributes!(trade_id: child.id)
            
            Auction::Unit.create!(
              trade_id: child.id,
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
              foreign_payment: product.foreign_payment
            )
          end
          
          raise '库存不足' if child.units.blank? || child.units.size != @trade.gift_per_count
        end
        product.sync_sell_data!
      end
    rescue => e
      Rails.logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
      @error_msg = e.message
    end
    
    if @error_msg.nil?
      respond_to do |format|
        format.html { redirect_to(params[:redirect] || gift_show_auction_trades_path(trade_id: @trade.id)) }
        format.json { render json: { trade: @trade } }
      end
    else
      respond_to do |format|
        format.html { redirect_to(request.referer || gift_show_auction_trades_path(trade_id: @trade.id)) }
        format.json { render json: { error: @error_msg } }
      end
    end
  end
  
  # 犒劳自己
  def reward
    @error_msg = nil
    
    begin
      ActiveRecord::Base.transaction do
        @user = current_user
        
        check_product params[:product_id], "无效的商品"
        
        product = Auction::Product.find params[:product_id]
        
        raise '无效的商品' unless product.published?
        
        product_count = params[:count].to_i
        
        raise '商品数量有误' unless product_count.between? Auction::Product::MIN_COUNT, Auction::Product::MAX_COUNT
        
        order_by = Auction::Category::PRIORITIES.map{ |p| {p[:name] => p[:order]} }.inject({}, &:merge)[product.category2 && product.category2.priority] || (Auction::Category::PRIORITIES.first||{})[:order]
        items     = product.items.published.unsold.order(order_by).first(product_count)
        # items     = product.items.published.order(order_by).first(product_count)
        
        # 库存判断
        raise '库存不足' if items.blank? || items.size != product_count
        
        @trade = Auction::Trade.create!(status: 'pay', checkout_token: SecureRandom.hex(16))
        
        @trade.units = begin
        
          # 卖场权限
          raise '无效的卖场权限' unless (@user.malls + (@user.level ? @user.level.malls : [])).include?(product.mall)
        
          price = product.discount
          raise '价格不能低于商品的最低价格' unless price >= product.minimum_price.to_i
          
          raise '订单中包含多件海外商品时，总价格不能超过1000' if product.location_id > 1 && product_count > 1 && (product_count * price) > 1000
          
          product_count.times.map do |_|
            item = product.items.published.unsold.order(order_by).first
            
            # 库存判断
            raise '库存不足' unless item.present?
            item.update_attributes!(trade_id: @trade.id)
            
            Auction::Unit.new(
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
              foreign_payment: product.foreign_payment
            )
          end
        end
      
        raise '库存不足' if @trade.units.blank?
      
        # use last contact or create new if data changed
        if params[:trade] && params[:trade][:contact]
          @contact = (id = params[:trade][:contact][:id]) && !id.empty? && (Auction::Contact.find(id) rescue nil)
        end
        
        raise '无效的地址' unless @contact.present?

        payment_price = price * product_count
        # 税费
        tax_price = (product.discount * product.tax_rate.to_f * product_count).round
        tax_price = 0 if tax_price <= 50 || product.location_id.to_i <= 1
        payment_price += tax_price      
        
        # update trade information
        @trade.update_attributes!({
          user_id: @user.try(:id),
          contact_id: @contact.try(:id),
          location_id: product.location_id,
          price: price * product_count,
          balance_price: 0,
          payment_price: payment_price,
          tax_price: tax_price,
          status: 'pay',
          identifier: '%04d%02d%02d%02d%04d%06s' % [Time.now.year, Time.now.month, Time.now.day, ((product.category2_id||0) % 100), (product.id % 10000), ((0..9).to_a*3+('A'..'Z').to_a).shuffle[0..5].join],
          client: 'gift',
        }.merge(cookies.instance_variable_get('@cookies').slice(*%w[link_id click_id latest_link_id latest_click_id])))
      
        @trade.updatings.create!(status: @trade.status)
        product.sync_sell_data!
      end
    rescue => e
      Rails.logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
      @error_msg = e.message
    end
    
    if @error_msg.nil?
      respond_to do |format|
        format.html { redirect_to(params[:redirect] || gift_show_auction_trades_path(trade_id: @trade.id)) }
        format.json { render json: { trade: @trade } }
      end
    else
      respond_to do |format|
        format.html { redirect_to(request.referer || gift_show_auction_trades_path(trade_id: @trade.id)) }
        format.json { render json: { error: @error_msg } }
      end
    end
  end
  
  def edit; end
  
  def update; end

  def opt; end
  
  # 支付完成后跳转页面
  # "/gift/trades/:trade_id/get?group=1&token="
  # "/gift/trades/:trade_id/get?group=0&child_id=&child_token="
  def forward
    @trade = Auction::Trade.find_by!(id: params[:id], user_id: current_user.id)
    
    url = "/gift/trades/#{ @trade.id }/get"
    parent_params = ["group=1", "token=#{ @trade.guest_token }"]
    @parent_url = "#{ url }?#{ parent_params.join("&") }"
    child_params = "group=0"
    child_params_arr = (@trade.gift_children || []).to_a.map{ |child| "child_id=#{ child.id }&child_token=#{ child.guest_token }" }
  
    @child_urls = child_params_arr.map{ |c| "#{ url }?#{ child_params }&#{ c }" }
    @product = @trade.gift_children[0].units[0].item.product
  end
  
  # 通过分享链接进入的action
  def get
    @only_child = params[:group].present? && params[:group].to_s == "0"
    begin
      check_receiving_step params[:id]
      
      @query = params.slice(:group, :token, :child_id, :child_token).to_query
    rescue => e
      my_logger e
      
      set_meet_child_trades
      
      @error_msg = error_msg(e.message)
      render action: :received_results
    end
  end
  
  # 领取礼品
  # 确认地址
  def receiving_gifts
    @only_child = params[:group].present? && params[:group].to_s == "0"
    begin
      check_receiving_step params[:trade_id]
    rescue => e
      my_logger e
      
      set_meet_child_trades
      
      @error_msg = error_msg(e.message)
      return render(action: :received_results)
    end
    
    @query_hash = params.slice(:group, :token, :trade_id, :child_id, :child_token, :contact_id, :location_id)
    
    @contact = Auction::Contact.find(params[:contact_id]) if params[:contact_id].present?
    
    if @user.ordered_contacts.present?
      @contact ||= @user.ordered_contacts.first
      @query_hash = @query_hash.merge({contact_id: @contact.id})
      @query = @query_hash.to_query
    else
      @query = @query_hash.to_query
      redirect_to "/gift/contacts/new?#{ @query }"
    end
  end
  
  # 领取礼品
  def received_gifts
    params_hash = {}.merge(params.slice(:child_id, :child_token))
    
    begin
      check_receiving_step params[:id]
      
      contact = Auction::Contact.find params[:contact_id].to_i
      
      child_trade = @group ? @trade.valid_gift_children.first : @child
      raise "1001" if child_trade.blank?
      ActiveRecord::Base.transaction do
        child_trade.update_attributes! user_id: @user.id, contact_id: contact.id, receive_gift_at: Time.now
        @trade.update_attributes! gift_gotten: @trade.gift_gotten + 1
      end
      child_trade.declare_wechat_customs!
      params_hash[:succ_id] = child_trade.id
      child_trade.delay_for(1.seconds, retry: false).send_success_notice
      child_trade.delay_for(1.seconds, retry: false).send_notice_for_identification
    rescue => e
      my_logger e
      params_hash[:err_code] = e.message
    end
    
    redirect_to received_results_gift_trade_path(params[:id], params_hash)
  end
  
  # 领取结果
  def received_results
    begin
      @user = current_user
      @success_msg = "恭喜，您已成功领取礼品" if params[:succ_id].present? && Auction::Trade.where("contact_id IS NOT NULL").exists?(id: params[:succ_id], gift_from: params[:id], user_id: @user.id)
      
      @error_msg = error_msg(params[:err_code]) if params[:err_code].present?
      @only_child = params[:child_id].present? && params[:child_token].present?
      
      @trade = Auction::Trade.find_by!(id: params[:id])
      @product = @trade.gift_children[0].units[0].item.product
      set_meet_child_trades
    rescue => e
      my_logger e
      @error_msg = error_msg(params[:err_code])
    end
  end
  
  private
    
    def check_receiving_step(trade_id)
      raise "0001" if params[:group].nil? || (! params[:group].to_s.in?(["0", "1"]))
      @group = params[:group].to_s == "1"
      
      # 母订单
      @trade = Auction::Trade.find_by!(id: trade_id)
      @product = @trade.gift_children[0].units[0].item.product
      
      # 母订单是否已完成
      raise '0002' unless @trade.is_completed?
      @user = current_user
      # 所有已经被领取了的子订单
      children = @trade.meet_gift_children
      raise "1002" if @user.id.in?(children.map(&:user_id))
      # 是否已经被领完
      raise "1001" unless @trade.gift_gotten < @trade.gift_count
      
      if @group
        raise "0001" if @trade.guest_token != params[:token]
      else
        @child = @trade.valid_gift_children.where(id: params[:child_id], guest_token: params[:child_token]).first
        raise "1001" if @child.nil?
      end
    end
    
    def my_logger(e)
      Rails.logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
    end
    
    def set_meet_child_trades
      @meet_child_trades = 
        ((@trade.meet_gift_children.where(@only_child ? { user_id: @user.id } : "1 = 1").includes(units: { item: :product }, user: { account: :connection_uxuan })) rescue nil)
    end
    
    def error_msg(code)
      {
        "0001" => "礼品领取参数错误",
        "0002" => "订单状态错误",
        "1001" => "亲！您来晚了！这份礼物已经被领取了",
        "1002" => "这份礼物您已经领取过了"
      }[code] || "出错了"
    end
end