# 新年活动
module NewYear
  # 创建红包
  # @params
  #   coupon_id: 红包id
  #   group_id: 参团id，不传则为开团
  def red_packet
    @error_msg = "红包发完了，后续活动更精彩，敬请关注！"

    respond_to do |format|
      format.json { render json: { error: @error_msg } }
    end
    
    # begin
    #   ActiveRecord::Base.transaction do
    #     raise "您来晚了，红包已经被领完啦" if redpack_sold_out?
    #     raise "财运红包活动已经截止啦，关注全球U选，更多好玩的活动在等你哟~" if redpack_timeout?
        
    #     @user = current_user
        
    #     if group_id = params[:group_id]
    #       @group = Groupon::Group.find group_id
    #       raise '这个团已经不能再参加啦' unless @group.can_join?
    #     end
        
    #     check_red_packet params[:coupon_id], @user, @group
        
    #     @trade = Auction::Trade.create!({
    #       status: "audit",
    #       checkout_token: SecureRandom.hex(16),
    #       user_id: @user.try(:id),
    #       location_id: @coupon.product.location_id,
    #       price: 0,
    #       balance_price: 0,
    #       payment_price: 0,
    #       identifier: '%04d%02d%02d%02d%04d%06s' % [Time.now.year, Time.now.month, Time.now.day, ((@coupon.product.category2_id||0) % 100), (@coupon.product_id % 10000), ((0..9).to_a*3+('A'..'Z').to_a).shuffle[0..5].join],
    #       client: 'uxuan',
    #       coupon_id: @coupon.id
    #     }.merge(params.slice(:group_id))
    #      .merge(cookies.instance_variable_get('@cookies').slice(*%w[link_id click_id latest_link_id latest_click_id])))
        
    #     @trade.updatings.create!(status: @trade.status)
        
    #     activate_group @trade, @user, @coupon, @group
    #   end
    # rescue => e
    #   Rails.logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
    #   @error_msg = e.message
    # end
    
    # if @error_msg.nil?
    #   respond_to do |format|
    #     format.html { redirect_to(params[:redirect] || auction_trade_path(@trade)) }
    #     format.json { render json: { trade: @trade } }
    #   end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to(request.referer || auction_trade_path(@trade)) }
    #     format.json { render json: { error: @error_msg } }
    #   end
    # end
  end
  
  private
    # 检查红包的有效性
    # 检查开团次数或参团次数
    # 检查商品是否为红包
    def check_red_packet(coupon_id, user, group)
      @coupon = Groupon::Coupon.find coupon_id
      
      # 检查商品是否为红包
      raise '此商品不能参加抢红包活动' unless @coupon.is_redpack?
      # 检查开团次数或参团次数
      if group
        raise "每人最多只能参加#{ group_join_num }次红包团~" if Groupon::Group.validating.joins(:group_trades).where(coupon_id: @coupon.id, groupon_group_trades: { user_id: user.id }).where.not(user_id: user.id).exists?
      else
        raise "每人最多只能开#{ group_lead_num }次红包团~" unless Groupon::Group.validating.where(coupon_id: @coupon.id, user_id: user.id).size < group_lead_num
      end
      
      # 检查红包的有效性
      raise '无效的红包' unless @coupon.published? && @coupon.product.published?
    end
    
    # 更新团数据
    def activate_group(trade, user, coupon, group = nil)
      group ||= Groupon::Group.create!({
                  coupon: coupon,
                  user_id: user.id,
                  discount: coupon.discount,
                  expired_at: Time.now + coupon.expired_after.to_i.hours,
                  minimum: coupon.minimum,
                  status: "pending"
                })
              
      group.group_trades.create_with(user_id: user.id, receipted_at: Time.now).find_or_create_by!(group: group, trade: trade)
      trade.update_attributes!(group_id: group.id)
    end
    
    def group_lead_num
      3
    end
    
    def group_join_num
      1
    end
end