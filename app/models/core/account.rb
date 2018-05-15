class Core::Account < ActiveRecord::Base
  has_many :updatings, -> { order 'id DESC' }, class_name: "Core::AccountsUpdating"
  belongs_to :user, foreign_key: 'id'
  
  has_one :connection_uxuan, -> { where(site: CORE_CONNECTION_SITE) }, class_name: "Core::Connection"


  def make_phone_activation_code #:nodoc: all
    return unless self.phone
    self.phone_activation_code = "%06d" % rand(1000000)
    self.phone_activation_code_expired_at = Time.new + 0.5.hour
  end

  def make_activation_code #:nodoc: all
    self.activation_code = "%06d" % rand(1000000)
  end

  # 生成邀请二维码，二维码过期时间是一个月
  # ticket 和 过期时间保存在 redis 中，提前一天刷新 ticket
  def invitation_code
    return unless (openid = self.connection_uxuan.try(:identifier))
    # scene_id = "scene:user_" + openid.to_s
    scene_id = "#{999}#{self.id}"
    ticket, expired_at = REDIS_CONN.hmget(scene_id, "ticket", "expired_at")

    unless ticket && expired_at.to_i > (Time.now - 1.day).to_i   # 提前一天刷新
      ticket = refresh_invitation_code(scene_id)
    end

    ticket
  end

  def refresh_invitation_code(scene_id)
    result = $client.create_qr_scene(scene_id, 2592000).result
    ticket = result['ticket']
    expired_at = Time.now.to_i + 2592000

    REDIS_CONN.hmset(scene_id, "ticket", ticket, "expired_at", expired_at)
    REDIS_CONN.expire(scene_id, 2592000)  # 设置 key 过期时间

    ticket
  end

  # 用 ticket 换取二维码链接
  def invitation_code_url
    $client.qr_code_url(invitation_code)
  end
end