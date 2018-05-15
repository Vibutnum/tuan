class Auction::Trade < ActiveRecord::Base

	has_many :units, :class_name => "Auction::Unit"
	has_many :updatings, :class_name => "Auction::TradesUpdating"
	belongs_to :contact, class_name: Auction::Contact
  belongs_to :unscoped_contact, -> { unscope(where: :active) }, class_name: Auction::Contact, foreign_key: :contact_id
	belongs_to :invoice_contact, class_name: Auction::Contact, foreign_key: 'invoice_contact_id'
	belongs_to :user
  has_one :group_trade, class_name: "Groupon::GroupTrade", foreign_key: :trade_id
  belongs_to :coupon, class_name: "Groupon::Coupon"
  belongs_to :gift_parent, class_name: "Auction::Trade", foreign_key: :gift_from
  has_many :gift_children, class_name: "Auction::Trade", foreign_key: :gift_from
  has_many :valid_gift_children, -> { where(user_id: nil, contact_id: nil, status: 'audit') }, class_name: "Auction::Trade", foreign_key: :gift_from
  has_many :meet_gift_children, -> { where("user_id IS NOT NULL AND contact_id IS NOT NULL").order(receive_gift_at: :desc) }, class_name: "Auction::Trade", foreign_key: :gift_from
  has_one :wechat_redpack, class_name: "Wechat::Redpack", foreign_key: :trade_id

	accepts_nested_attributes_for :contact
	accepts_nested_attributes_for :invoice_contact

	validates_associated :contact, allow_blank: true
	validates_associated :invoice_contact, allow_blank: true

	default_scope { where(active: true) } 

	scope :active, -> { where(active: true) }
  
  scope :gotten, -> { where("gift_gotten = gift_count") }
  
  scope :surplus, -> { where("gift_gotten < gift_count") }
  
  scope :completed, -> { where status: "complete" }
  
	
	STATUS = {
		"pay" => '待付款',
		"audit" => '待审核',
		"ship" => '待发货',
		"receive" => '待收货',
		"contribute" => '待投稿',
		"complete" => '已完成',
		"cancel" => '已取消',
		"accept" => '接受',
		"reject" => '拒绝',
		"punished" => '惩罚',
		"freezed" => '已冻结',
		"blocked" => '通关失败',
		"return" => '返还',
		"prepare" => '出库中'
	}
  
  DELIVERY_SERVICES = [
    { :name => 'fedex', :title => '联邦快递', :url => 'https://www.fedex.com/fedextrack/?action=track&cntry_code=cn' },
    { :name => 'sf', :title => '顺丰速运', :url => 'http://sf-express.com/cn/sc/' },
    { :name => 'zjs', :title => '宅急送', :url => 'http://www.zjs.com.cn/WS_Business/WS_Business_GoodsTrack.aspx' },
    { :name => 'ems', :title => '邮政EMS', :url => 'http://www.ems.com.cn/mailtracking/you_jian_cha_xun.html' },
    { :name => 'offline', :title => '线下' },
    { :name => 'pickup', :title => '自取' },
    { :name => 'yt', :title => '圆通' },
    { :name => 'scic', :title => '中加国际快递' },
    { :name => 'bestex', :title => '百世汇通' },
    { :name => 'zto', :title => '中通快递' }
  ]

	def status_zh
    case status
    when "audit"
      group_trade.present? ? I18n.t("auction.trades.audit_detail.#{ group_trade.status }") : "已付款"
    else
      STATUS[status]
    end
	end

  def gift_status_zh
    STATUS[status]
  end
  
  def delivery_service_zh
    (DELIVERY_SERVICES.detect{ |d| d[:name] == delivery_service }[:title]) rescue ''
  end
  
  def is_completed?
    status.to_s == "complete"
  end
  
  def status_step_class
    case status
    when "pay", "audit", "ship", "prepare"
      "status-step-check"
    when "receive"
      "status-step-delivery"
    when "complete"
      "status-step-complete"
    else
      ""
    end
  end

	def foreign_purchase?
		self.location_id > 1
	end
  
  def is_gift_parent?
    client_is?("gift") && is_gift? && gift_from.nil?
  end
  
  def is_reward?
    client_is?("gift") && !is_gift?
  end
  
  # 是否是红包订单
  def is_red_packet?
    is_completed? && client_is?("uxuan") && user_id.present? && contact_id.nil?
  end
  
	def calculate_product_hourglass! # :nodoc: all
		self.units.map{|unit| unit.item.product }.uniq.map{|product| product.update_attributes!(:hourglass_pause_duration => (product.hourglass_pause_duration || 0) + (Time.now - self.created_at) / 1.minute) if product.hourglass_started_at }
	end

  def groupon!
    return if self.status == 'pay'

    Auction::Trade.connection.transaction do
      if coupon_id
        coupon = Groupon::Coupon.find coupon_id
        group = if group_id
                  Groupon::Group.find(group_id).tap{ |g| g.group_trades.create_with(user_id: user_id, receipted_at: Time.now).find_or_create_by!(group: g, trade: self) }
                else
                  Groupon::Group.create!({
                    coupon: coupon,
                    user_id: user_id,
                    discount: coupon.discount,
                    expired_at: Time.now + coupon.expired_after.to_i.hours,
                    minimum: coupon.minimum,
                    status: "pending"
                  }).tap{ |g| g.group_trades.create_with(user_id: user_id, receipted_at: Time.now).find_or_create_by!(group: g, trade: self) }                  
                end
        update_attributes!(group_id: group.id) if group
      end
    end

  end
  
  # 送礼支付完成回调
  def gift!(options = {})
    if self.status == 'audit'
      Auction::Trade.connection.transaction do
        self.gift_children.each do |child|
          child.update_attributes!(options.slice(:payment_service, :payment_identifier, :payment_return, :pay_editor_id, :pay_at).merge(status: 'audit'))
          child.updated!(:status => child.status)
        end
      
        update_attributes!(status: "complete")
        updated!(:status => self.status)
      end
    end
  end

	# def audit!(options = {}) # :nodoc: all
	# 	return unless self.status == 'pay'

	# 	Auction::Trade.connection.transaction do
	# 		self.update_attributes!(options.slice(:payment_service, :payment_identifier, :payment_return, :pay_editor_id, :pay_at).merge(status: 'audit'))
	# 		self.updated!(:status => self.status)
	# 		# 创建团关系
	# 		if coupon_id
	# 			coupon = Groupon::Coupon.find coupon_id
	# 			group = if group_id
	# 								Groupon::Group.find(group_id).tap{ |g| g.group_trades.create_with(user_id: user_id, receipted_at: Time.now).find_or_create_by!(group: g, trade: self) }
	# 							else
	# 				        Groupon::Group.create!({
	# 				          coupon: coupon,
	# 				          user_id: user_id,
	# 				          discount: coupon.discount,
	# 				          expired_at: Time.now + coupon.expired_after.to_i.hours,
	# 				          minimum: coupon.minimum,
	# 				          status: "pending"
	# 				        }).tap{ |g| g.group_trades.create_with(user_id: user_id, receipted_at: Time.now).find_or_create_by!(group: g, trade: self) }
	# 							end
	# 			update_attributes!(group_id: group.id) if group
	# 		end
	# 	end
	# end

	# def wechat_checkout_url(remote_ip, openid)
	# 	package_options = {
	# 		bank_type: "WX",
	# 		body: "#{self.units[0].item.product.name.truncate(30)}等#{self.units.count}件",
	# 		trade_type: "JSAPI",
	# 		out_trade_no: self.id,
	# 		total_fee: 1, # TODO 记得改价, self.payment_price * 100,
	# 		fee_type: 1,
	# 		notify_url: "/auction/trades/#{self.id}/wechat_return",
	# 		spbill_create_ip: remote_ip,
	# 		input_charset: "UTF-8",
	# 		openid: openid,
	# 		appid: PAYMENT_CONFIG['wechat']['appId'],
	# 		mch_id: PAYMENT_CONFIG['wechat']['partnerId'],
	# 		nonce_str: SecureRandom.hex,
	# 		# time_start: self.created_at && self.created_at.strftime("%Y%m%d%H%M%S"),
	# 		# time_expire: self.created_at && (self.created_at + 7200.seconds).strftime("%Y%m%d%H%M%S"),
	# 	}.reject{ |k,v| v.blank? }

	# 	sign = generate_sign(package_options, PAYMENT_CONFIG['wechat']['partnerKey'])
	# 	res = invoke_remote(PAYMENT_CONFIG['wechat']['unifiedorderUrl'], make_payload(package_options, sign))

	# 	if res && res['return_code'] == 'SUCCESS' && res['result_code'] == 'SUCCESS'
 #      prepay_id = res['prepay_id'] # 预支付ID
 #      Rails.logger.debug("======== set prepay_id: #{prepay_id} ========")

 #      options = {
 #          appId: PAYMENT_CONFIG['wechat']['appId'],
 #          timeStamp: Time.now.to_i.to_s,
 #          nonceStr: SecureRandom.hex,
 #          package: "prepay_id=#{prepay_id}",
 #          signType: "MD5",
 #      }

 #      options.merge!( paySign: generate_sign(options, PAYMENT_CONFIG['wechat']['partnerKey']))

 #    else
 #    	Rails.logger.debug("------- set prepay_id fail: #{res} -------")

 #    	{}
	# 	end
	# end

	# def query_wechat!
	# 	return false unless self.status == 'pay'

	# 	r = begin
	# 		self.wechat_result
	# 	rescue
	# 		false
	# 	end

	# 	Rails.logger.debug '---'*100
	# 	Rails.logger.debug r

	# 	# TODO 暂时不验证金额，记得去掉注释
	# 	if r && r['return_code'] == 'SUCCESS' && r["result_code"] == 'SUCCESS' && r['trade_state'] == 'SUCCESS' && r['out_trade_no'].to_i == self.id# && r['total_fee'].to_i == self.payment_price * 100
	# 		self.audit!(:payment_service => "wechat_uxuan", payment_identifier: r['transaction_id'], payment_return: r.to_json) 
	# 	end
	# end

	# def wechat_result
 #    options = {
 #      appid: PAYMENT_CONFIG['wechat']["appId"],
 #      mch_id: PAYMENT_CONFIG['wechat']["partnerId"],
 #      out_trade_no: self.id,
 #      nonce_str: SecureRandom.hex,
 #    }	

 #    sign = generate_sign(options, PAYMENT_CONFIG['wechat']['partnerKey'])

 #    Rails.logger.debug '---'*100
 #    Rails.logger.debug make_payload(options, sign)
    
 #    invoke_remote(PAYMENT_CONFIG['wechat']['orderqueryUrl'], make_payload(options, sign))
	# end

	# def verify_sign(params, sign)
	# 	str = generate_sign(params, PAYMENT_CONFIG['wechat']['partnerKey'])
	# 	str == sign
	# end

  # 订单退款
  def refund
    unit = self.units.first
    gt   = Groupon::GroupTrade.where(trade_id: self.id).first
    return false unless self.status == 'audit' && self.payment_service == 'wechat_uxuan' && gt && gt.refund_status != Groupon::GroupTrade::FAILURE_STATUS && unit

    r = begin
      self.invoke_refund
    rescue => e
      Rails.logger.debug e
      false
    end

    Rails.logger.debug '-------微信退款接口返回参数--------'
    Rails.logger.debug r

    # 返回参数示例
    # {"return_code"=>"SUCCESS", "return_msg"=>"OK", "appid"=>"wxb0e9382e4c006f5c", "mch_id"=>"1286133301", "nonce_str"=>"O0as3Oxes3YtAA3x", "sign"=>"04FCD0914EDE59BAE95807D665EB2FDA", "result_code"=>"SUCCESS", "transaction_id"=>"1008360986201511201684937155", "out_trade_no"=>"34738", "out_refund_no"=>"34304", "refund_id"=>"2008360986201511250084722549", "refund_channel"=>"", "refund_fee"=>"1", "coupon_refund_fee"=>"0", "total_fee"=>"1", "cash_fee"=>"1", "coupon_refund_count"=>"0", "cash_refund_fee"=>"1"}
    if r && r["return_code"] == "SUCCESS" && r["result_code"] == "SUCCESS"
      gt.update_attributes!(refund_status: Groupon::GroupTrade::SUCCESS_STATUS, refund_identifier: r['refund_id'], refund_return: r.to_json, refund_at: Time.now)
      unit.returnit!(status: 'complete', transfer_at: Time.now)

      Rails.logger.debug "订单##{self.id}退款成功"
    else
      gt.update_attributes!(refund_status: Groupon::GroupTrade::FAILURE_STATUS, refund_return: r ? r.to_json : e.try(:message), refund_at: Time.now)
      unit.returnit!(status: 'transfer')

      Rails.logger.debug "订单##{self.id}退款失败"
      RefundMailer.delay_for(5.seconds, retry: false).failure(self.id)
    end
    
  end

  # 调用微信退款接口
  INVOKE_REFUND_REQUIRED_FIELDS = %i(out_trade_no out_refund_no total_fee refund_fee)
  def invoke_refund
    params = {
      appid: PAYMENT_CONFIG['wechat']["appId"],
      mch_id: PAYMENT_CONFIG['wechat']["partnerId"],
      nonce_str: SecureRandom.hex,
      op_user_id: self.user_id,
      out_refund_no: self.id,
      out_trade_no: self.id,
      refund_fee: self.payment_price * 100,
      total_fee: self.payment_price * 100,
    }

    check_required_options(params, INVOKE_REFUND_REQUIRED_FIELDS)

    @rest_client_options ||= {
      ssl_client_cert: apiclient_cert[:certificate],
      ssl_client_key: apiclient_cert[:key],
      verify_ssl: OpenSSL::SSL::VERIFY_NONE
    }

    sign = generate_sign(params, PAYMENT_CONFIG['wechat']['partnerKey'])
    invoke_remote PAYMENT_CONFIG['wechat']["refundUrl"], make_payload(params, sign)
  end
  
  # 领取礼品成功通知
  def send_success_notice
    # template_id      = "62-X72b5sI7zSgWFeZ_RjJcfigZsEAo8Lv8VoLAM4Fc"
    template_id = "ISIYC9LEsY9MmcMRG9Ti56ZEtyiDYDWq0Rk0x1JnfhA"
    url         = "http://#{DOMAIN_CONFIG['uxuan']}" + "/auction/trades/gift_show?trade_id=" + gift_parent.id.to_s
    topcolor    = "#FF0000"
    data        = {
                    first: {
                      value: "您赠送的礼物已经被领取了。",
                      color: "#173177"
                    },
                    toName: {
                      value: self.user.try(:name), # 领取人
                      color: "#777777"
                    },
                    gift: {
                      value: "#{ self.units[0].try(:item).try(:product).try(:name) } x #{ self.units.size }", # 商品
                      color: "#777777"
                    },
                    time: {
                      value: self.receive_gift_at.try(:strftime, "%Y-%m-%d %H:%M:%S"), # 领取时间
                      color: "#777777"
                    },
                    remark: {
                      value: "全球U选，收礼送礼一键搞定!",
                      color: "#173177"
                    }
                }
    
    
    # openid = gift_parent.user.account.try(:connection_uxuan).try(:identifier)
    openid = gift_parent.user.openid
    return unless openid.present?
    msg = $client.send_template_msg(openid, template_id, url, topcolor, data)
    Rails.logger.debug msg
  end
  
  def buy_alone?
    client_is?("uxuan") && group_id.nil? && coupon_id.nil?
  end
  
  def client_is?(c)
    c.to_s == client.to_s
  end
  
  def send_notice_for_identification
    return unless foreign_purchase?
    return if unscoped_contact.try(:id_number).present?
    
    template_id = "vorstgpxge8XFrQsV6Ucu2jWlpiAsHRpJ3uwY5IkB_c"
    # template_id = "hwb1vjK1KrHOekYbEcYUJ25bQ0fn6M-iqR4k8fZJDcI"
    
    url         = "http://#{DOMAIN_CONFIG['uxuan']}" + "/#{ client_is?("uxuan") ? 'auction' : 'gift' }/contacts/#{ unscoped_contact.id }/supplement?trade_id=#{ self.id }"
    
    topcolor    = "#FF0000"
    data        = {
                    first: {
                      value: "亲爱的用户您好，您订单中有发货地为海外的商品，为了能够顺利清关，请补全收件人的身份证号码。",
                      color: "#173177"
                    },
                    keyword1: {
                      value: self.identifier, # 订单号
                      color: "#777777"
                    },
                    keyword2: {
                      value: "已支付（收件人姓名：#{ self.user.try(:name) }）", # 领取人
                      color: "#777777"
                    },
                    remark: {
                      value: "此身份证号仅用作海关通关，不会用作其他用途!",
                      color: "#173177"
                    }
                }
    
    # openid = user.account.try(:connection_uxuan).try(:identifier)
    openid = user.openid
    return unless openid.present?
    msg = $client.send_template_msg(openid, template_id, url, topcolor, data)
    Rails.logger.debug msg
  end

  # 送礼子订单微信报关
  def declare_wechat_customs!
    return unless self.gift_from
    payment_price = self.price + self.tax_price
    options = {
      'partner' => PAYMENT_CONFIG['wechat']['partnerId'],
      'out_trade_no' => self.gift_from,
      'customs' => 1, # 广州
      'action_type' => 1, # 新增
      'business_type' => 2, # 直邮进口
      'mch_customs_no' => 'IE150908677422',

      'sub_order_no' => self.id,
      'fee_type' => 'CNY',
      'order_fee' => payment_price * 100,
      'transport_fee' => 0,
      'product_fee' => payment_price * 100,
    }

    options.merge!({
      'input_charset' => 'UTF-8',
      'sign_type' => 'MD5',
    })
    options.merge!({
      'sign' => Digest::MD5.hexdigest((options.sort << ['key', PAYMENT_CONFIG['wechat']['partnerKey']]).map{|k,v|"#{k}=#{v}"}.join("&")),
    })

    action = "http://mch.tenpay.com/cgi-bin/mch_custom_declare.cgi"
    url = cgi_escape_action_and_options(action, options)

    r = begin
      Timeout::timeout(30) do
        res = HTTParty.get(url)
        Rails.logger.info "wechat_uxuan_notify_customs  #{res.inspect}"
        res
      end
    rescue Exception => e
      Rails.logger.info "wechat_uxuan_notify_customs error #{res.inspect}"
      false
    end

    if r
      customs_entry = Auction::CustomsEntry.find_or_initialize_by(trade_id: self.id)
      customs_entry.data = r.body
      customs_entry.success = (r['root'] && r['root']['retcode'] == '0')
      customs_entry.save!
    end
  end

  
	private

	def apiclient_cert
		# p12 格式报错
		#@apiclient_cert ||= OpenSSL::PKCS12.new(File.binread(Rails.root.join("config", PAYMENT_CONFIG['wechat']['apiclient_cert_path']).to_path) , PAYMENT_CONFIG['wechat']["partnerId"])

		apiclient_cert_path = Rails.root.join("config", PAYMENT_CONFIG['wechat']['apiclient_cert']).to_path
		apiclient_key_path  = Rails.root.join("config", PAYMENT_CONFIG['wechat']['apiclient_key']).to_path

		@apiclient_cert ||= {}
		@apiclient_cert[:certificate] ||= OpenSSL::X509::Certificate.new(File.read( apiclient_cert_path ))
		@apiclient_cert[:key] ||= OpenSSL::PKey::RSA.new(File.read( apiclient_key_path  ))

		@apiclient_cert
	end

	def check_required_options(options, names)
    names.each do |name|
      warn("WxPay Warn: missing required option: #{name}") unless options.has_key?(name)
    end
	end

	def make_payload(params, sign)
		"<xml>#{params.map { |k, v| "<#{k}>#{CGI.escapeHTML(v.to_s)}</#{k}>" }.join}<sign>#{sign}</sign></xml>"
	end

  def html_escape(str)
    str.gsub(/&/, '&amp;').gsub(/"/, '&quot;').gsub(/'/, '&#39;').gsub(/</, '&lt;').gsub(/>/, '&gt;')
  end

	def generate_sign(params, key)
		query = params.sort.map do |key, value|
			"#{key}=#{html_escape value.to_s}"
		end.join('&')

		Digest::MD5.hexdigest("#{query}&key=#{key}").upcase 
	end

	def invoke_remote(url, payload)
		@rest_client_options ||= {}

    r = RestClient::Request.execute(
      {
        method: :post,
        url: url,
        payload: payload,
        headers: { content_type: 'application/xml' }
      }.merge({timeout: 30, open_timeout: 30}).merge(@rest_client_options)
    )

    h = Hash.from_xml(r)
    h['xml']		
	end

  def cgi_escape_action_and_options(action, options) # :nodoc: all
    "#{action}?#{options.sort.map{|k, v| "#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}" }.join('&')}"
  end

end