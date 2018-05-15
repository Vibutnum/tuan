class Auction::ApplicationController < ApplicationController
  private
    def current_user
      super
      @current_user ? Auction::User.find(@current_user.id) : nil
    end
end