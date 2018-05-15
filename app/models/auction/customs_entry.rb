##
# = 拍卖 报关 表
#
# == Fields
#
# trade_id :: 订单ID
# success :: 成功?
# alipay_declare_no :: 支付宝报关流水号
# data :: 数据
#
# == Indexes
# trade_id
#

class Auction::CustomsEntry < ActiveRecord::Base
  self.table_name = :auction_customs_entries
  
  belongs_to :trade
end