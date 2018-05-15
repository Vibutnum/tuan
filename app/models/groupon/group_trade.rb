class Groupon::GroupTrade < ActiveRecord::Base
  belongs_to :group
  belongs_to :trade, class_name: "Auction::Trade"
  belongs_to :user, class_name: "Auction::User"

  after_create :act_on_group

  SUCCESS_STATUS = 'success'
  FAILURE_STATUS = 'failure'

  # 我的团状态：等待团员(pending)、团购失败，等待退款（refunding）、团购失败，已退款(refunded)、团购失败(failure)、团购成功(success)
  def status
    case self.group.try(:status)
    when Groupon::Group::PENDING_STATUS
      Groupon::Group::PENDING_STATUS
    when Groupon::Group::SUCCESS_STATUS
      Groupon::Group::SUCCESS_STATUS
    when FAILURE_STATUS
      self.refund_status == SUCCESS_STATUS ? 'refunded' : 'refunding'
    else
      "failure"
    end
  end

  private
    def act_on_group
      options = {
        current: group.current.to_i + 1
      }
      if options[:current] >= group.minimum.to_i
        options[:status] = Groupon::Group::SUCCESS_STATUS
        # 红包团callback
        if group.coupon.try(:is_redpack?)
          group.trades.each{ |trade| trade.update_attributes!(status: "complete"); trade.updatings.create!(status: trade.status); Wechat::Redpack.create_by_trade(trade) }
        end
        
        group.delay_for(1.seconds, retry: false).send_success_notice
        group.delay_for(1.seconds, retry: false).contact_checked
      end
      group.update_attributes! options
    end
end
