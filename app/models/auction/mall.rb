class Auction::Mall < ActiveRecord::Base
	default_scope { where(active: true) } 
end