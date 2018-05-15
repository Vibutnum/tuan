class AddIndexToWechatRedpacks < ActiveRecord::Migration
  def change
    add_index :wechat_redpacks, :trade_id
    add_index :wechat_redpacks, :created_at
  end
end
