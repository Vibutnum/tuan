class CreateWechatInvitations < ActiveRecord::Migration
  def change
    create_table :wechat_invitations do |t|
      t.integer :scan_id
      t.string :open_id
      t.string :inviter_id

      t.timestamps null: false
    end
    add_index :wechat_invitations, :open_id
    add_index :wechat_invitations, :inviter_id
  end
end
