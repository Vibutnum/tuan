class Core::AccountsUpdating < ActiveRecord::Base
  belongs_to :account, class_name: Core::Account
end