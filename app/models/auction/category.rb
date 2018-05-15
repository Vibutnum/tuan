class Auction::Category < ActiveRecord::Base
	default_scope { where(active: true) }
	
	PRIORITIES = [
		{ :name => "storage_at_asc", :title => "入库时间（默认）", :order => "storage_at ASC" },
		{ :name => "expired_at_asc", :title => "过期时间", :order => "expired_at ASC" },
		{ :name => "purchase_type_asc_and_storage_at_asc", :title => "采购类型和入库时间", :order => "purchase_type ASC, storage_at ASC" },
		{ :name => "purchase_type_asc_and_storage_at_asc_and_cost_price_asc", :title => "采购类型和入库时间和成本价", :order => "purchase_type ASC, IF(purchase_type=5, storage_at, cost_price) ASC" },
		{ :name => "random", :title => "随机", :order => "RAND()" },
	]
end