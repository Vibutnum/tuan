class WechatsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :login_filter
  before_filter :check_weixin_legality

  def index
    render text: params[:echostr]
  end

  def create
    Rails.logger.debug params[:xml]

    unless params[:xml]
      Rails.logger.debug '---1---'
      @content = "感谢您关注全球U选！我们搜刮全球好货！这里汇聚健康美食、美容药妆、营养保健品、生活用品及母婴产品，让您足不出户低价买到风靡全球的各类海外爆款商品！"
      return render("text", format: :xml)
    end

    case params[:xml][:MsgType]
    when 'text'
      @content = "感谢您关注全球U选！我们搜刮全球好货！这里汇聚健康美食、美容药妆、营养保健品、生活用品及母婴产品，让您足不出户低价买到风靡全球的各类海外爆款商品！"
      return render("text", format: :xml)
    when 'event'
      if params[:xml][:Event] == "subscribe" || params[:xml][:Event] == "SCAN"
        event_key = params[:xml][:EventKey]
        scene_id = event_key.sub(/^qrscene_/, '') if event_key

        Wechat::Scan.create(event_name: params[:xml][:Event], open_id: params[:xml][:FromUserName], scene_id: scene_id)
        # event_id = (scene_id.to_i == 13)? 5045 : 5015
        event_id = {
          '13' => 5045,
          '20160223_aolai' => 5066
        }[scene_id] || 5015


        if message = Auction::Voucher.create_subscribe(params[:xml][:FromUserName], event_id)
          @content = message
          return render("text", format: :xml)
        end
      end
    end

    render text: ""
  end

  private
  # 根据参数校验请求是否合法，如果非法返回错误页面
  def check_weixin_legality
    array = [OAUTH_CONFIG['wechat_uxuan']['token'], params[:timestamp], params[:nonce]].sort
    render text: "Forbidden", status: 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end


end