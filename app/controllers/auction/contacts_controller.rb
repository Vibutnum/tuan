class Auction::ContactsController < Auction::ApplicationController
	
	def index
		@current_user = current_user
		@contacts = @current_user.ordered_contacts.paginate page: params[:page], per_page: 6

		@query_str = params.slice(:coupon_id, :ungrouped, :trade, :contact_id, :location_id).to_query
    @query = params.slice(:coupon_id, :ungrouped, :trade, :location_id).to_query
    
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
	end

	def new
		@query_str = params.slice(:coupon_id, :ungrouped, :trade,:location_id).to_query
		@contact = Auction::Contact.new
	end

	def create
		query = params.delete(:query)
		@contact = Auction::Contact.new(contact_params.slice(:name, :country, :province, :city, :town, :address, :postcode, :phone, :mobile, :id_number).merge(:user_id => @current_user.id))

		if @contact.save
			if query.present?
				redirect_to "/auction/trades/new?" + query + "&contact_id=#{@contact.id}"
			else
				redirect_to auction_contacts_path
			end
		else
			redirect_to request.referer || auction_contacts_path
		end
	end

	def edit
		query_hash = params.slice(:coupon_id, :ungrouped, :trade, :contact_id,:location_id)#.to_query
		@query_str = query_hash.to_query
		@contact = Auction::Contact.find_by(id: params[:id])

		redirect_to auction_contacts_path(query_hash) and return unless @contact

		if @contact.user_id != @current_user.id
			not_authorized
			return
		end
	end

	def update
		query = params.delete(:query)
		@contact = Auction::Contact.find(params[:id])

		if @contact.user_id != @current_user.id
			not_authorized
			return
		end

		success = database_transaction do
			@contact.update_attributes!(:active => false)
			@contact = Auction::Contact.create!(contact_params.slice(:name, :country, :province, :city, :town, :address, :postcode, :phone, :mobile, :id_number).merge(:user_id => @current_user.id))
		end

		if success
			if query
				redirect_to "/auction/contacts/?" + query
			else
				redirect_to auction_contacts_path
			end
		else
			redirect_to request.referer || auction_contacts_path
		end
	end

	def destroy
		@contact = Auction::Contact.find(params[:id])
		
		if @contact.user_id != @current_user.id
			not_authorized
			return
		end

		@contact.active = false
		@contact.save	

		redirect_to auction_contacts_path
	end
  
  def get_cities
    render json: Rails.cache.fetch(city_cache_key(params[:province_name]), city_cache_expires_in){ get_areas("province", "city", params[:province_name]) }.to_json
  end
  
  def get_towns
    render json: Rails.cache.fetch(town_cache_key(params[:city_name]), town_cache_expires_in){ get_areas("city", "town", params[:city_name]) }.to_json
  end
  
	private
	def contact_params
		params.require(:auction_contact).permit(:id, :name, :country, :province, :city, :town, :address, :postcode, :phone, :mobile, :id_number)
	end
end