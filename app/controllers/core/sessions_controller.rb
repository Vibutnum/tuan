class Core::SessionsController < ApplicationController
  skip_filter :login_filter

  # 仅供测试用
  def logout
    logout_killing_session!
    
    respond_to do |format|
      format.html { redirect_to params[:redirect] || root_path }
      format.xml
    end
  end 
end