class Gift::ApplicationController < ApplicationController
  layout "gift_application"
  
  private
    def current_user
      super
      @current_user ? Auction::User.find(@current_user.id) : nil
    end
    
    def check_product(id, msg = nil)
      unless id.to_i.in?((Data::Common::File.banners(DATA_CONFIG['gift_products_file_id']) rescue []).map{ |p| p["products"] }.flatten)
        logger.error %[无效的product id: #{ id }]
        msg.nil? ? (raise ActiveRecord::RecordNotFound) : (raise msg)
      end
    end
end