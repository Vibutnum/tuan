class Auction::Unit < ActiveRecord::Base
	belongs_to :item, class_name: "Auction::Item"
	belongs_to :trade, class_name: "Auction::Trade"

	validate do |unit|
		other_units = trade.units.where("id != ?", unit.id)
		balance_payment_price = trade.price.to_i - trade.payment_price.to_i + trade.delivery_price.to_i + trade.tax_price.to_i
		if (unit.amount_returned.to_i + unit.amount_balance_returned.to_i) > unit.price
			errors.add(:total_amount_returned, '退款总额不能超过商品单价')
		elsif other_units.sum(:amount_returned).to_i+unit.amount_returned.to_i > trade.payment_price.to_i
			errors.add(:amount_returned, '现金退款不能超过总现金支付') 
		elsif other_units.sum(:amount_balance_returned).to_i+unit.amount_balance_returned.to_i > balance_payment_price
			errors.add(:amount_balance_returned, '余额退款不能超过总余额支付') 
		end
	end

	def returnit!(options = {}) #:nodoc: all
		return if self.returned?

		self.update_attributes!(options.merge(:returned => true))
		self.item.update_attributes!(:trade_id => nil)
		self.item.product.sync_sell_data!
	end
end