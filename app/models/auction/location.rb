class Auction::Location < ActiveRecord::Base
  default_scope { where active: true }
end