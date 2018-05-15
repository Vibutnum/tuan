class Auction::Item < ActiveRecord::Base
	belongs_to :product, class_name: "Auction::Product"
  belongs_to :trade, class_name: "Auction::Trade"

	default_scope { where(active: true) }
	
	scope :sold, -> { where.not(trade_id: nil) }
	scope :unsold, -> { where(trade_id: nil) }
	scope :published, -> { where(published: true) }
	scope :unpublished, -> { where(published: false) }
end