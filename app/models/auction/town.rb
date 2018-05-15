class Auction::Town < ActiveRecord::Base
  default_scope { where active: true }
  scope :available, -> { where(destroyed_at: nil, published: true).where.not(city_id: nil) }
end