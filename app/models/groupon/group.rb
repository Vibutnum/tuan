class Groupon::Group < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :coupon
  belongs_to :user, class_name: "Auction::User"
  belongs_to :account, class_name: "Core::Account"
  has_many :group_trades
  has_many :trades, through: :group_trades, source: :trade
  
  validates :coupon, presence: true
  validates :user, presence: true
  
  PENDING_STATUS = 'pending'
  SUCCESS_STATUS = 'success'
  FAILURE_STATUS = 'failure'
  
  scope :overdue, -> { where (arel_column(:expired_at).eq(nil).or(arel_column(:expired_at).lt Time.now)).and(arel_column(:status).eq PENDING_STATUS) }
  
  scope :validating, -> { where arel_column(:status).eq(SUCCESS_STATUS).or(arel_column(:status).eq(PENDING_STATUS).and(arel_column(:expired_at).not_eq nil).and(arel_column(:expired_at).gt Time.now)) }
  
  class << self
    def arel_column(col)
      arel_table[col.intern]
    end
  end
  
  def pending?
    status.to_s == PENDING_STATUS
  end
  
  def outmoded?
    expired_at.nil? || Time.now > expired_at
  end
  
  def can_failure?
    pending? && outmoded?
  end
  
  def change_status_to(s)
    update! status: s.to_s
  end
  
  def can_join?
    pending? && !outmoded?
  end
  
  def failure?
    status.to_s == FAILURE_STATUS
  end
  
  def success?
    status.to_s == SUCCESS_STATUS
  end

  def send_success_notice
    first_value = if coupon.try(:is_redpack?)
      "恭喜您，您参加的红包团购已成功。"
    else
      "恭喜您，您参加的团购已成功，我们会尽快为您发货。"
    end
    
    # touser      = "ofU2dwn4zkkZCOMNloSPeVVHOf60"
    template_id = "URe38Xx6ZH7xlaJPpNpWy8Z51nlUVLB7csCgrcomAQs"
    url         = "http://#{DOMAIN_CONFIG['uxuan']}" + "/g/groups/" + self.id.to_s
    topcolor    = "#FF0000"
    data        = {
                    first: {
                      value: first_value,
                      color: "#173177"
                    },
                    keyword1: {
                      value: self.coupon.try(:name) || self.coupon.try(:product).try(:name),
                      color: "#f64441"
                    },
                    keyword2: {
                      value: self.user.name, # 团长
                      color: "#f64441"
                    },
                    remark: {
                      value: "谢谢您的支持，欢迎再次使用!",
                      color: "#173177"
                    }
                }

    self.trades.each do |t|
      # openid = t.user.account.try(:connection_uxuan).try(:identifier)
      openid = t.user.openid
      next unless openid.present?
      msg = $client.send_template_msg(openid, template_id, url, topcolor, data)
      Rails.logger.debug msg
    end
  end

  def send_failure_notice
    first_value = if coupon.try(:is_redpack?)
      "您参加的红包拼团失败了。"
    else
      "您参加的拼团组团失败，我们正在为您退款。"
    end
    # touser      = "ofU2dwn4zkkZCOMNloSPeVVHOf60"
    template_id = "URe38Xx6ZH7xlaJPpNpWy8Z51nlUVLB7csCgrcomAQs"
    url         = "http://#{DOMAIN_CONFIG['uxuan']}"
    topcolor    = "#FF0000"
    data        = {
                    first: {
                      value: first_value,
                      color: "#173177"
                    },
                    keyword1: {
                      value: self.coupon.try(:name) || self.coupon.try(:product).try(:name), # 商品名
                      color: "#f64441"
                    },
                    keyword2: {
                      value: self.user.name, # 团长
                      color: "#f64441"
                    },
                    remark: {
                      value: "足不出户，U选全球，点击这里，去查看更多的商品吧",
                      color: "#173177"
                    }
                }
    self.trades.each do |t|
      # openid = t.user.account.try(:connection_uxuan).try(:identifier)
      openid = t.user.openid
      next unless openid.present?
      msg = $client.send_template_msg(openid, template_id, url, topcolor, data)
      Rails.logger.debug msg
    end
  end
  
  def contact_checked
    trades.includes(user: { account: :connection_uxuan }, contact: {}).each(&:send_notice_for_identification)
  end
end
