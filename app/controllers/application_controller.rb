class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  before_filter :login_filter
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  class << self
    private
      def member_actions
        %w{show new edit}
      end
  end
  
  member_actions.each do |action|
    define_method action.intern do
      find_resource
    end
  end
  
  # 补填身份证
  # get
  def supplement
    return not_authorized if supplement_checked
    
    render 'shared/contacts/supplement'
  end
  
  # 补填身份证
  # put
  def submission
    return not_authorized if supplement_checked
    
    succ_url, err_url = if @trade.client_is?("uxuan")
      [auction_trade_path(@trade), supplement_auction_contact_path(@contact, { trade_id: @trade.id })]
    else
      [gift_show_auction_trades_path(trade_id: @trade.id), supplement_gift_contact_path(@contact, { trade_id: @trade.id })]
    end
    
    id_number = (params[:contact] || {})[:id_number]
    
    return redirect_to(err_url) if id_number.blank?
    
    unless id_number =~ /\A((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?\z/
      @contact.id_number = id_number
      @err_code = true
      return render('shared/contacts/supplement')
    end
    
    success = database_transaction do
      @contact.update_attributes!(id_number: id_number)
    end
    
    success ? redirect_to(succ_url) : redirect_to(err_url)
  end
  
  private
    
    def supplement_checked
      @contact = Auction::Contact.unscoped.find_by!(id: params[:id])
      @trade = Auction::Trade.find_by(id: params[:trade_id], user_id: @current_user.id)
    
      @module = @trade.client_is?("uxuan") ? "auction" : "gift"
      
      @contact.user_id != @current_user.id || @trade.contact_id != @contact.id || @trade.user_id != @current_user.id
    end
    
    def login_filter
      if Rails.env == 'development'
        p "伪登录" # TODO
        @current_account = Core::Account.find(41905)
        @current_user = @current_account.user
      else
        if current_account && current_account.connection_uxuan && current_user
          if session[:user_login_on] != Time.now.to_date
            @current_user.login_today(request.remote_ip)
            session[:user_login_on] = Time.now.to_date
          end
        else
          not_authorized
        end
      end
    end
    
    def current_account
      @current_account ||= login_from_session
    end
    
    def current_account=(new_account)
      session[:user_id] = new_account ? new_account.id : nil
      session[:user_expired_at] = 3.months.from_now
      @current_account = new_account || false
    end
    
    def current_user
      @current_user ||= (@current_account.user if @current_account)
    end
    
    def current_user= new_user
      @current_user = new_user
    end
    
    def login_from_session
      current_account = Core::Account.find_by_id(session[:user_id]) if session[:user_id] && session[:user_expired_at] && Time.now < session[:user_expired_at]
    end
    
    def logout_killing_session!
      logout_keeping_session!
      reset_session
    end
    
    def logout_keeping_session!
      # @current_account.forget_me if @current_account.is_a? Core::Account
      @current_account = false
      # kill_remember_cookie!
      session[:user_id] = nil
      session[:user_login_on] = nil
    end
    
    def database_transaction
      begin
        ActiveRecord::Base.transaction do
          yield
        end
        true
      rescue => e
        logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
        false
      end
    end
    
    def not_authorized
      if @current_user
        respond_to do |format|
          format.html { raise ActiveResource::ForbiddenAccess.new(response) }
        end

      # 未登录，跳转到微信授权
      else
        respond_to do |format|
          format.html {
            redirect_to new_core_connection_path(site: CORE_CONNECTION_SITE, redirect: request.url)
          }
        end
      end
    end
    
    def model_class
      controller_path.singularize.classify.constantize
    rescue NameError => e
      raise ActiveRecord::RecordNotFound.new(e.message)
    end
    
    def find_resource
      @object =
      if action_name.in? new_actions
        model_class.new
      elsif params[:id]
        model_class.find params[:id]
      end
      instance_variable_set "@#{ controller_name.singularize }", @object unless instance_variable_defined? "@#{ controller_name.singularize }"
    end
    
    # record not found
    def record_not_found(e)
      logger.error %Q{Error: #{ e.message }}
      redirect_to '/404.html'
    end
    
    def new_actions
      %w{new create}
    end
    
    def get_areas(main, sub, name)
      main_area_data = "Auction::#{ main.to_s.singularize.capitalize }".constantize.send(:available).send :find_by_name, name
      sub_area_datas = "Auction::#{ sub.to_s.singularize.capitalize }".constantize.send(:available).send :where, { "#{ main.to_s.singularize }_id" => main_area_data.try(:id) }
    
      if sub_area_datas.empty?
        []
      else
        sub_area_datas.map{ |data| { name: data.name } }.uniq
      end
    
    rescue
      []
    end
    
    def province_cache_key
      "uxuan_auction_province"
    end
  
    def city_cache_key(province_name)
      "uxuan_auction_city_#{ province_name }"
    end
  
    def town_cache_key(city_name)
      "uxuan_auction_town_#{ city_name }"
    end
    
    def province_cache_expires_in
      { expires_in: 5.days }
    end
    
    def city_cache_expires_in
      { expires_in: 4.days }
    end
    
    def town_cache_expires_in
      { expires_in: 3.days }
    end
    
    helper_method :get_areas, :province_cache_key, :city_cache_key, :town_cache_key, :province_cache_expires_in, :city_cache_expires_in, :town_cache_expires_in
    
    # 红包是否已发完
    def redpack_sold_out?
      REDIS_CONN.llen(Wechat::Redpack::PACK_KEY).to_i == 0
    end
    helper_method :redpack_sold_out?
    
    # 新年发红包活动截止日期
    # 2016-02-10 23:59
    def redpack_timeout?
      Time.now > DateTime.parse("2016-02-10 23:59")
    end
    helper_method :redpack_timeout?

    # 拉粉设置
    def invitation_config
      @invitation_config ||= (Data::Common::File.banners(DATA_CONFIG['invitation_id']) rescue {}) 
    end
    helper_method :invitation_config
end
