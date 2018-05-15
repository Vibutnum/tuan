class Groupon::CouponsController < Auction::ApplicationController
  
  def index
    @redpackets = model_class.published.listable_coupons.red_packet.ordered.includes(:product).ransack(params[:q]).result
    @coupons, @sold_out_items = model_class.published.listable_coupons.not_red_packet.ordered.includes(:product).ransack(params[:q]).result.partition{ |coupon| !coupon.sold_out? }
  end
  
  def show
    find_resource
    
    if @coupon.is_redpack?
      raise ActiveRecord::RecordNotFound if redpack_timeout? || redpack_sold_out?
    end
  end
  
  # 检查团购可用性
  def rebuy_checked
    coupon = Groupon::Coupon.find params[:id]
    res = {
      succ: true
    }
    
    if (!coupon.rebuy_allowed? && Auction::Trade.where(coupon_id: coupon.id, user_id: current_user.id).where('payment_identifier is not null').exists?)
      res[:succ] = false
      res[:error] = '此团购不允许重复购买'
    end
    
    render json: res
  end
end