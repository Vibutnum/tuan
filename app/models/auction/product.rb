class Auction::Product < ActiveRecord::Base

	has_many :items, -> { where(active: true) }
	belongs_to :category1, class_name: 'Auction::Category'
	belongs_to :category2, class_name: 'Auction::Category'
	belongs_to :mall, class_name: 'Auction::Mall'
	has_many :images, -> { where(active: true).order('COALESCE(sequence, 1000000) ASC, id ASC') }
  belongs_to :location, -> { where published: true }

	default_scope { where(active: true) } 

	scope :published, -> { where(published: true) }
  
  MIN_COUNT = 1
  MAX_COUNT = 10
  
  def foreign_product?
    self.location_id > 1
  end

	def sync_sell_data! #:nodoc: all
		return unless self.active?
		self.items_count = self.items.count
		self.items_unpublished_count = self.items.unpublished.count
		self.items_unsold_count = self.items.published.unsold.count
		self.sold_count = self.items.published.sold.count
		self.unsold_count = self.items.published.unsold.select('DISTINCT measure').map.size
		self.measures_unsold_count = self.items.published.map{|i| i.measure = nil if i.measure.blank?; i }.group_by(&:measure).map{|g| { g[0] => (c = g[1].reject(&:trade_id).size) && c > 0 ? 1 : 0 } }.inject({}, &:merge).to_json
		self.save! if self.changed?
	end
  
  def location_description
    ("#{ location.name }" + (location.description.present? ? "，#{ location.description }" : "")) rescue ""
  end
end