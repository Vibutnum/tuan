class Core::ConnectionsController < ApplicationController
  skip_filter :login_filter
  ##
  # == 新建
  #
  # === Request
  #
  # ==== Resource
  #
  # GET /core/connections/new
  #
  # ==== Parameters
  #
  # site :: 网站，本项目中仅支持 wechat_uxuan
  # redirect :: 跳转地址
  # type :: 连接类型，可为%w[default binding]之一，默认为 default，会自动创建账户；binding不会创建账户。
  # !!for weixin
  # scope :: 域类型，可为%w[snsapi_base snsapi_userinfo]之一，默认为 snsapi_userinfo，参数名可统一为：type
  #
  # === Response
  #
  # ==== HTML
  #
  # 重定向到外部网站
  #
  def new
    site = params[:site].to_s
    redirect = "http://#{request.domain(999)}/core/connections/callback.json?redirect=#{CGI::escape(params[:redirect].to_s)}"
    config = OAUTH_CONFIG[site]
    # callback = "http://#{request.domain(999)}/core/connections/callback?site=#{CGI::escape(site)}&redirect=#{CGI::escape(redirect)}&type=#{CGI::escape(params[:type].to_s)}"
    callback = "http://#{DOMAIN_CONFIG['ihaveu']}/core/connections/callback?site=#{CGI::escape(site)}&redirect=#{CGI::escape(redirect)}&type=#{CGI::escape(params[:type].to_s)}"

    case site
    when CORE_CONNECTION_SITE
      scope = params[:scope].blank? ? 'snsapi_userinfo' : params[:scope]  # 默认获取详细信息
      options = {
        appid: config['appid'],
        redirect_uri: push_param(callback, "scope=#{scope}"),
        response_type: 'code',
        scope: scope
      }
      authorize_url = "#{config['authorize_path']}?#{options.map{|k, v|"#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}"}.join('&')}#wechat_redirect"
    end

    redirect_to authorize_url if authorize_url
  end

  # 调用主站接口登录
  # 修改：微信回调地址改为主站callback方法，再跳转回此方法。以此解决回调域名只能填写一个，而两个项目都需要授权的问题。
  def callback   
    redirect   = params[:redirect].to_s
    account_id = $cms_session.get(cookies[:_ihaveu_session]).to_i rescue nil

    if account_id && account_id > 0
      session[:user_id] = account_id
      session[:user_expired_at] = 3.months.from_now
    else
      Rails.logger.debug '登录失败'
    end

    redirect_to redirect.present? ? redirect : '/'
  end

  # def callback
  #   site = params[:site].to_s
  #   redirect = params[:redirect].to_s
  #   config = OAUTH_CONFIG[site]
  #   callback = "http://#{request.domain(999)}/core/connections/callback?site=#{CGI::escape(site)}&redirect=#{CGI::escape(redirect)}"

  #   case site
  #   when CORE_CONNECTION_SITE
  #     redirect_to(redirect.present? && redirect || '/') and return unless params[:code].present?

  #     options = {
  #       appid: OAUTH_CONFIG[site]['appid'],
  #       secret: OAUTH_CONFIG[site]['secret'],
  #       code: params[:code].to_s,
  #       grant_type: 'authorization_code',
  #     }

  #     access_token_params = JSON.parse Timeout::timeout(30){ HTTParty.get("#{config['access_token_path']}?#{options.map{|k, v|"#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}"}.join('&')}").body }
  #     p access_token_params

  #     redirect_to(redirect.present? && redirect || '/') and return if access_token_params['errcode'].present?
      
  #     if params[:scope].to_s == 'snsapi_base' && params[:type].to_s == 'binding'
  #       redirect_to(redirect.present? && push_param(redirect, "open_id=#{access_token_params['openid']}") || '/') and return
  #     end

  #     user_info_options = access_token_params.slice('access_token', 'openid').merge(lang: 'zh_CN')
  #     resp_user_info = JSON.parse Timeout::timeout(30){ HTTParty.get("#{config['user_info_path']}?#{user_info_options.map{|k, v|"#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}"}.join('&')}").body }
  #     redirect_to(redirect.present? && redirect || '/') and return if resp_user_info['errcode'].present?
      
  #     Rails.logger.debug '-------wechat_user_info----------'
  #     Rails.logger.debug resp_user_info
      
  #     @connection = Core::Connection.where(site: site, identifier: resp_user_info['openid'].to_s, active: true).first_or_initialize
  #     @connection.attributes = {
  #       identifier: resp_user_info['openid'],
  #       token: access_token_params['access_token'].to_s,
  #       refresh_token: access_token_params['refresh_token'].to_s,
  #       expired_at: Time.now + access_token_params['expires_in'].to_i,
  #       data: resp_user_info.to_json,
  #       name: resp_user_info['nickname'].to_s,
  #       pic: resp_user_info['headimgurl'].to_s,
  #       sex: { '0' => nil, '1' => 'male', '2' => 'female' }[resp_user_info['sex'].to_s],
  #     }

  #     @connection.save
  #   end

  #   session[:connection_id] = @connection && @connection.id
  #   @connection = create_account(site) unless params[:type].to_s == 'binding'

  #   redirect_to redirect.present? ? redirect : '/'    
  # end

  private
  # 组装个参数进去
  def push_param(url, param_str)
    arr = url.split('?')
    arr[0] + '?' + ( (arr[1] && arr[1].split('&').push(param_str).join('&')) || param_str )
  end 
  
  # def create_account(site)
  #   database_transaction do
  #     unless @current_user  # 未登录
  #       unless @connection.account_id  # 且未关联账号
          
  #         # 如果有其它 unionID 关联帐号，则不需要创建新用户
  #         if (site == 'uwechat' || site == 'uapp' || site == CORE_CONNECTION_SITE)
  #           @connection_union = Core::Connection.where('union_id = ? and active = ? and identifier != ?', @connection.union_id, true, @connection.identifier).first
            
  #           if @connection_union.present? && @connection_union.account.present?
  #           # unless @connection_union.blank? || @connection_union.account.blank?
  #             @connection.update_attributes!(:account_id => @connection_union.account_id)
              
  #             # 登录
  #             self.current_account = @connection_union.account
  #             return @connection
  #           end
  #         end

  #         @account = Core::Account.new(:ip_address => request.remote_ip, :link_id => cookies[:link_id], :click_id => cookies[:click_id])
  #         @account.make_phone_activation_code
  #         @account.make_activation_code
  #         @account.save!
  #         @account.updated!

  #         @user = Core::User.new
  #         @user.id = @account.id
  #         @user.update_attributes!(:name => @connection.name)

  #         @info = Core::Info.new
  #         @info.id = @account.id
  #         @info.save!

  #         @setting = Core::Setting.new
  #         @setting.id = @account.id
  #         @setting.update_attributes!(:search_engine_indexing => true)

  #         @connection.update_attributes!(:account_id => @account.id)

  #         Auction::User.acquire(@user.id)
  #       end
  #       # 登录
  #       self.current_account = @connection.account
  #       # set_cookie(:remember_me, '1')
  #     end
  #   end
  #   @connection
  # end
end