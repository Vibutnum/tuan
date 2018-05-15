##
# = 拍卖 代金券 表
#
# == Fields
#
# event_id :: 活动ID
# editor_id :: 编辑ID
# user_id :: 用户ID
# trade_id :: 交易ID
# identifier :: 编号
# obtained_at :: 获得时间
# used_at :: 使用时间
# remark :: 备注
# active? :: 有效？
#
# == Indexes
#
# active, user_id
# trade_id
# active, event_id
#
class Auction::Voucher < ActiveRecord::Base
  self.table_name = :auction_vouchers

  validates_uniqueness_of :identifier, :allow_blank => true

  scope :active, -> { where(active: true) }

  # 2016 全球U选扫码送礼券
  # @params
  #  uid:关注用户的微信open_id
  def self.create_subscribe(uid, event_id)
    raise "open_id is blank" if uid.blank?
    event = Auction::Event.find(event_id)
    return nil if event.ended_at < Time.now

    identifier = Digest::MD5.hexdigest("#{uid}_#{event_id}")[0, 12]
    
    voucher = self.active.find_by(identifier: identifier)
    
    message = if event_id == 5045
%Q{您好，欢迎关注全球U选！2016开年福利！你已获得全球U选借贷宝专属20元现金券一张！点击下方链接登录全球U选，即可获得。全球U选，搜刮全球好货！祝您购物愉快！
点击链接兑换：http://tuxuan.ihaveu.com/vouchers?voucher_identifier=#{identifier}}
    elsif event_id == 5066
%Q{您好，欢迎关注全球U选！恭喜您获得优众生活奥莱馆20元专属现金券！点击下方链接登录全球U选，即可领取。全球U选，搜刮全球好货！祝您购物愉快！
点击链接兑换：http://tuxuan.ihaveu.com/vouchers?voucher_identifier=#{identifier}}
    else
%Q{您好，欢迎关注全球U选！2016开年福利！关注即得20元现金券！点击下方链接登录全球U选，即可获得。全球U选，搜刮全球好货！祝您购物愉快！
点击链接兑换：http://tuxuan.ihaveu.com/vouchers?voucher_identifier=#{identifier}}    
    end    

    return (voucher.user_id.nil? ? message : nil) if voucher# 用户重复关注的场合,如果代金券已经被认领则返回空

    self.create!(
      event_id: event_id,
      identifier: identifier,
      editor_id: 1,
      remark: "微信关注公众号自动发放:全球U选扫码送礼券"
    )
    message
  end

end
