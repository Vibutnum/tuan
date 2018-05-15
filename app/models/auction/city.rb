class Auction::City < ActiveRecord::Base
  default_scope { where active: true }
  scope :available, -> { where(destroyed_at: nil, published: true).where.not(province_id: nil) }
end