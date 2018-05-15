class Auction::Province < ActiveRecord::Base
  default_scope { where active: true }
  scope :available, -> { where destroyed_at: nil, published: true }
end