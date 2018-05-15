class CreateWechatScans < ActiveRecord::Migration
  def change
    create_table :wechat_scans do |t|
      t.string :event_name
      t.string :open_id
      t.string :scene_id

      t.timestamps null: false
    end
    add_index :wechat_scans, :open_id

  end
end
