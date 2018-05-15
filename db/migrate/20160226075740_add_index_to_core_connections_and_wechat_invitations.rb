class AddIndexToCoreConnectionsAndWechatInvitations < ActiveRecord::Migration
  def change
    add_index :core_connections, :identifier
    add_index :core_connections, :site
  end
end
