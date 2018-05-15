class Wechat::Scan < ActiveRecord::Base
  after_create :if_new_subscriber

  def if_new_subscriber
    if self.event_name == "subscribe"
      # 如果是首次关注
      if (m = self.scene_id.match("999")) && (inviter_id = m.post_match) && Wechat::Scan.where(open_id: self.open_id, event_name: "subscribe").where.not(id: self.id).first.nil? # 如果是受邀关注
        inviter = Core::Account.find(inviter_id).connection_uxuan.identifier
        Wechat::Invitation.create_with(scan_id: self.id, inviter_id: inviter)
                          .find_or_create_by(open_id: self.open_id)
      end

      Wechat::Redpack.try_send_new_register(self.open_id)
    end
  end
end