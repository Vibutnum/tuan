class RefundMailer < ActionMailer::Base
  # 自动退款失败，给财务发送邮件
  def failure(trade_id)
    begin
      @trade = Auction::Trade.find trade_id
      @url = "http://#{ DOMAIN_CONFIG['ihaveu'] }/manage/groupon/groups/#{ @trade.group_id }"
      mail(:to => MAILER_CONFIG['to']['refund'], :subject => "「全球U选」微信团购订单自动退款失败通知")
    rescue => e
      Sidekiq.logger.info "发送邮件失败"
      Sidekiq.logger.info "trade id: #{ trade_id }"
      Sidekiq.logger.info "err msg: #{ e.message }"
    end
  end
end
