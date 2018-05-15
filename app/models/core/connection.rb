class Core::Connection < ActiveRecord::Base
  belongs_to :account

  default_scope { where(active: true) } 
end