class Groupon::GroupsController < Auction::ApplicationController
  def index
    @group_trades = Groupon::GroupTrade.includes(group: { coupon: :product }).where(user_id: current_user.id).order('id DESC').ransack(params[:q]).result.paginate(page: params[:page])

    # TO DELETE
    # @groups = model_class.where(user_id: current_user.id).order('id desc').includes(coupon: :product).ransack(params[:q]).result.paginate(page: params[:page])
    # ids = @groups.pluck(:id)
    # @group_trades = Groupon::GroupTrade.where(group_id: ids, user_id: current_user.id).includes(:trade)
    # if (overdue_records = model_class.where(id: ids).overdue).exists?
    #   overdue_records.update_all status: model_class.const_get('FAILURE_STATUS')
    # end
    
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
  
  def show
    find_resource
    @owner         =    @group.user
    @group_trades  =    @group.group_trades.includes(:user, trade: :wechat_redpack).where.not(user_id: @owner.id).order(created_at: :asc)
    user           =    current_user
    @is_owner      =    @owner === user
    @is_valid      =    @group.can_join?
    @has_joined    =    @group_trades.exists? user_id: user.id
  end
end