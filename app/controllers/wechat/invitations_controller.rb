class Wechat::InvitationsController < ApplicationController
  layout "invitation_application"

  def index
    @results = Wechat::Invitation.ranking_list(invitation_config, 5)
    
    @myconnection_uxuan = @current_account.connection_uxuan
    @myfans  = Wechat::Invitation.my_fans(invitation_config, @myconnection_uxuan.identifier)
    
    @hide_mine = @results.detect{ |r| r["inviter_id"] == @myconnection_uxuan.identifier }.present?
  end
  
  def show
    @myconnection_uxuan = @current_account.connection_uxuan
    # @myfans  = Wechat::Invitation.my_fans(@myconnection_uxuan.identifier)
    @myfans  = Wechat::Invitation.my_fans(invitation_config, @myconnection_uxuan.identifier).paginate page: params[:page], per_page: 20
  end

  def share
    @sharer = Core::Account.find(params[:id])
    @qr_code = @sharer.invitation_code_url
    @myconnection_uxuan = @sharer.connection_uxuan
  end
  
  def user_info
    res = Rails.cache.fetch("weixin_user_info_#{ params[:id] }", expires_in: 7.days.to_i){ $client.user(params[:id]).result.slice("nickname", "headimgurl") }
    
    render json: res
  end
end