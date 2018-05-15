# +-----------------+--------------+------+-----+---------+----------------+
# | Field           | Type         | Null | Key | Default | Extra          |
# +-----------------+--------------+------+-----+---------+----------------+
# | id              | int(11)      | NO   | PRI | NULL    | auto_increment |
# | open_id         | varchar(255) | YES  | MUL | NULL    |                |  
# | mch_billno      | varchar(255) | YES  |     | NULL    |                |
# | trade_id        | int(11)      | YES  |     | NULL    |                |
# | amount          | int(11)      | YES  |     | NULL    |                |金额 单位: 分
# | send_at         | datetime     | YES  |     | NULL    |                |程序调用API的时间 (而不是查询接口返回的时间)
# | success         | tinyint(1)   | YES  |     | NULL    |                |发送接口是否成功  return_code和result_code都为SUCCESS的时候为true
# | received_at     | datetime     | YES  |     | NULL    |                |查询接口返回的红包领取时间
# | status          | varchar(255) | YES  |     | NULL    |                |发送成功后，查询接口返回的状态: SENDING:发放中 SENT:已发放待领取  FAILED：发放失败  RECEIVED:已领取 REFUND:已退款
# | server_response | text         | YES  |     | NULL    |                |
# | created_at      | datetime     | NO   |     | NULL    |                |
# | updated_at      | datetime     | NO   |     | NULL    |                |
# +-----------------+--------------+------+-----+---------+----------------+
class Wechat::Redpack < ActiveRecord::Base
  belongs_to :trade, class_name: Auction::Trade

  PACK_KEY = "monkey_hb"
  class << self
    def make_pack_list
      raise "pack list is present!" if REDIS_CONN.llen(PACK_KEY) > 0
      pack_list = []
      [[180, 38000], [280, 15000], [580, 6800], [680, 2000], [880, 800], [1880, 500], [8800, 200]].each do |amount, num|
        num.times { pack_list << amount }
      end

      pack_list.shuffle.each do |amount|
        REDIS_CONN.rpush(PACK_KEY, amount)
      end
    end

    # 删除redis中的红包列表, 慎用!!
    def remove_pack_list
      REDIS_CONN.del(PACK_KEY)
    end

    # 打印现存的红包信息
    def show_pack_list
      pack_list = REDIS_CONN.lrange(PACK_KEY , 0 ,REDIS_CONN.llen(PACK_KEY))
      puts "红包总个数: #{pack_list.size}"
      pack_list.group_by { |i| i }.each do |i, items|
        puts "红包金额: #{i}分, #{items.size}个"
      end
      nil
    end

    # 抽奖
    def lottery_draw
      return if Date.today != Date.new(2016, 2, 11) 
      open_id = self.where(success:true).select("open_id").order("rand()").first.open_id
      connection = Core::Connection.find_by(site: "wechat_uxuan", identifier: open_id)
      body = <<-BODY
你好, 获奖用户如下:

用户ID: #{connection.account_id}
微信昵称: #{connection.name}
微信头像: #{connection.pic}

此邮件由系统自动发出，请勿回复。如有问题请联系 panfu@ihaveu.net
      BODY
      cc = ['di.wang@ihaveu.net', 'vicky@ihaveu.net', 'panfu@ihaveu.net', 'charles@ihaveu.net', 'wei.xia@ihaveu.net']
      ActionMailer::Base.mail(to: 'jianbo.wang@ihaveu.net', cc: cc, body: body, subject: "全球U选公众号春节活动抽奖邮件").deliver!
    end

    # 查询所有成功发放的红包状态并更新数据库
    def wechat_query
      self.where("success = ? AND (status is null OR status IN (?) )", true, ["SENDING", "SENT"]).each do |redpack|
        xml = redpack.call_wechat_query!
        redpack.update_with_srvrsp(xml, :query)
      end
    end

    # 新关注用户若存在未发送红包则发送
    def try_send_new_register(open_id)
      redpack = self.where("open_id = ? AND send_at is null", open_id).first
      redpack.delay_for(5.seconds, retry: false).send_directly if redpack
    end

    def create_by_trade(trade)
      open_id = trade.user.open_id
      raise "该用户没有open id" if open_id.blank?
      
      amount = REDIS_CONN.rpop(PACK_KEY).to_i
      raise "红包发完了，后续活动更精彩，敬请关注！" if amount == 0

      mch_billno = [PAYMENT_CONFIG['wechat']["partnerId"], Time.now.strftime('%Y%m%d'), trade.id.to_s.rjust(10, '0')].join
      redpack = self.create!(
        open_id: open_id,
        mch_billno: mch_billno,
        trade_id: trade.id,
        amount: amount, 
      )

      redpack.delay_for(5.seconds, retry: false).send_with_subscribe
    end
  
  end# end self class

  # 调用微信红包接口
  # https://pay.weixin.qq.com/wiki/doc/api/cash_coupon.php?chapter=13_5
  def call_wechat_send!
    raise "invalid call" if self.send_at.present?
    wishing = case amount
    when 180
      "钱不多，寓意好！别灰心，再组个团，得88元红包哦"
    when 280
      "双倍的发送给你，祝你猴年财运旺！再组个团，得88元红包哦"
    when 580
      "我发我发，财神到家！再组个团，红包会更大哦！"
    when 680
      "顺顺利利，恭喜發財！再组个团，红包会更大哦！"
    when 880
      "新年大吉，恭喜發財！距离88元红包不远咯，再组个团迎财神吧！"
    when 1880
      "恭喜發財，猴年吉祥！距离88元红包不远咯，再组个团迎财神吧！"
    when 8800
      "恭喜發財！新年好运不可挡！传说截图发到朋友圈财运会更旺哦！"
    else
      "恭喜發財！新年好运不可挡！传说截图发到朋友圈财运会更旺哦！"
    end

    options = {
      'nonce_str' => SecureRandom.hex,
      'mch_billno' => self.mch_billno,
      'mch_id' => PAYMENT_CONFIG['wechat']["partnerId"],
      'wxappid' => PAYMENT_CONFIG['wechat']["appId"],
      'send_name' => "全球U选",
      're_openid' => self.open_id,
      'total_amount' => self.amount, # 单位: 分
      'total_num' => 1,
      'wishing' => wishing,
      'client_ip' => ip_address,
      'act_name' => "财神敲门送红包",
      'remark' => "每人参团1次，发起3次，最多领取4次红包",
    }

    call_wechat("https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack", options)   
  end

  # 用户若关注微信号则发送红包
  def send_with_subscribe
    user_info = $client.user(self.open_id)
    subscribe = (user_info.result['subscribe'] == 1)
    if subscribe
      xml = self.call_wechat_send!
      update_with_srvrsp(xml, :send)
    end
  end

  # 直接发送
  def send_directly
    xml = self.call_wechat_send!
    update_with_srvrsp(xml, :send)
  end

  # 通过微信接口查询红包发送情况
  # https://pay.weixin.qq.com/wiki/doc/api/cash_coupon.php?chapter=13_7&index=6
  def call_wechat_query!
    options = {
      'nonce_str' => SecureRandom.hex,
      'mch_billno' => self.mch_billno,
      'mch_id' => PAYMENT_CONFIG['wechat']["partnerId"],
      'appid' => PAYMENT_CONFIG['wechat']["appId"],
      'bill_type' => "MCHT",
    }

    call_wechat("https://api.mch.weixin.qq.com/mmpaymkttransfers/gethbinfo", options)
  end

  def update_with_srvrsp(body, action)
    result = Hash.from_xml(body)['xml'] rescue {}
    case action
    when :send
      self.update_attributes!(send_at: Time.now, server_response: body, success: result['return_code'] == 'SUCCESS' && result['result_code'] == 'SUCCESS')
    when :query
      self.update_attributes!(status: result['status'], received_at: result['hblist'].try(:[], 'hbinfo').try(:[], 'rcv_time'))
    end
  end

  def call_wechat(action, options)
    sign = Digest::MD5.hexdigest((options.sort << ['key', PAYMENT_CONFIG['wechat']['partnerKey']]).map{|k,v|"#{k}=#{v}"}.join("&")).upcase
    cert_path = Rails.root.join("config", PAYMENT_CONFIG['wechat']['apiclient_cert']).to_path
    key_path  = Rails.root.join("config", PAYMENT_CONFIG['wechat']['apiclient_key']).to_path

    m = Mechanize.new
    m.cert= OpenSSL::X509::Certificate.new(File.read(cert_path))
    m.key = OpenSSL::PKey::RSA.new(File.read(key_path))
    m.verify_mode= OpenSSL::SSL::VERIFY_NONE
    m.post(action, "<xml>#{options.map { |k, v| "<#{k}>#{v}</#{k}>" }.join}<sign>#{sign}</sign></xml>").body  
  end


  private

  # 获得本机(服务器)IP地址
  # http://stackoverflow.com/questions/5029427/ruby-get-local-ip-nix
  def ip_address
    public_ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4? and !intf.ipv4_loopback? and !intf.ipv4_multicast? and !intf.ipv4_private?}
    (public_ipv4 || Socket.ip_address_list.detect{|intf| intf.ipv4_private?}).ip_address
  end

end



