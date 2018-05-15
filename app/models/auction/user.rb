class Auction::User < ActiveRecord::Base
  belongs_to :level, class_name: "Auction::Level"
  has_many :contacts, -> { order("created_at desc") }
  belongs_to :coupon, class_name: "Groupon::Coupon"
  belongs_to :account, class_name: Core::Account, foreign_key: :id
  
  def default_contact
    contacts.try(:first)
  end

  def malls #:nodoc: all
    self.mall_ids.to_s.scan(/\d+/).map{|id| Auction::Mall.find_by_id(id) }.compact
  end

  def ordered_contacts
    contacts.sort_by{|contact| (contact.id != default_contact_id).to_s }
  end

  # 临时补丁: 针对存在用户微信号错误的情况
  def open_id
    connection_uxuan = self.account.connection_uxuan
    
    if connection_uxuan.nil?
      wechat_connection = Core::Connection.find_by(site: 'wechat', account_id: self.id)
      connection_uxuan = Core::Connection.find_by(site: 'wechat_uxuan', union_id: wechat_connection.union_id) if wechat_connection
    end
    connection_uxuan.try(:identifier)
  end

  alias_method :openid, :open_id

  def self.acquire(id) #:nodoc: all
    record = self.find_by_id(id)
    # if !record || record.updated_at < 5.minutes.ago
    #   u = Core::User.find_by_id(id)
    #   # logger.info "\n\n\n\n#{id}\n\n\n#{u}\n\n"
    #   ( record = self.new; record.id = u.id ) unless record
    #   record.name = u.name
    #   record.sex = u.sex
    #   record.pic = u.pic
    #   record.login_at = Time.now
    #   record.save
    # end
    # record
  end
end