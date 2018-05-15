class Auction::Contact < ActiveRecord::Base
	default_scope { where(active: true) }

  validates :name, :address, presence: true
 
  before_save :upcase_id_number!
  
  def upcase_id_number!
    self.id_number.upcase! if self.id_number.present?
  end
end