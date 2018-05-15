class Core::User < ActiveRecord::Base
  belongs_to :account, :foreign_key => "id"
  has_many :logins
  has_many :trades, class_name: 'Auction::Trade'

  def login_today(ip_address) # :nodoc: all
    login = Core::Login.find_or_initialize_by(user_id: self.id, login_on: Time.now.to_date)
    login.ip_address ||= ip_address
    account.last_login_on = Date.today
    account.save if account.changed?
    login.save if login.changed?
  end
end