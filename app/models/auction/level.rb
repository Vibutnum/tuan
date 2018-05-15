class Auction::Level < ActiveRecord::Base
	default_scope { where(active: true) }
	
	def malls #:nodoc: all
		self.mall_ids.to_s.scan(/\d+/).map{|id| Auction::Mall.find_by_id(id) }.compact
	end
end