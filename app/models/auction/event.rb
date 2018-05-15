##
# = 拍卖 活动 表
#
# == Fields
#
# editor_id :: 编辑ID
# name :: 名称
# description :: 描述
# amount :: 金额
# limitation :: 限制
# price :: 价格
# started_at :: 开始时间
# ended_at :: 结束时间
# active? :: 有效？
#
# == Indexes
#
class Auction::Event < ActiveRecord::Base
	self.table_name = :auction_events
end
