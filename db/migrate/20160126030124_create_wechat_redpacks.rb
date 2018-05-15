class CreateWechatRedpacks < ActiveRecord::Migration
  def change
    create_table :wechat_redpacks do |t|
      t.string :open_id
      t.string :mch_billno
      t.integer :trade_id
      t.integer :amount    # 金额 单位: 分
      t.datetime :send_at  # 程序调用API的时间 (而不是查询接口返回的时间)
      t.boolean :success   # 发送接口是否成功  return_code和result_code都为SUCCESS的时候为true
      t.datetime :received_at # 查询接口返回的红包领取时间
      t.string :status  # 发送成功后，查询接口返回的状态: SENDING:发放中 SENT:已发放待领取  FAILED：发放失败  RECEIVED:已领取 REFUND:已退款
      t.text :server_response # 发送接口返回的信息

      t.timestamps null: false
    end

    add_index :wechat_redpacks, :open_id
  end
end
