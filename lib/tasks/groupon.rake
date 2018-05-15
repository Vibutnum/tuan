namespace :groupon do
  namespace :group do 
    desc 'examine'
    task examine: :environment do
      Rails.logger.debug "----- begin groupon:group:examine ------"
      Groupon::Group.where(status: Groupon::Group::PENDING_STATUS).find_each do |group|
        if group.can_failure?
          Groupon::Group.connection.transaction do
            group.change_status_to(Groupon::Group::FAILURE_STATUS)  # 修改团状态
            # 非红包团才修改订单状态
            unless group.coupon.try(:is_redpack?)
              group.trades.where(status: 'audit').each(&:refund)      # 订单自动退款
            end
            group.send_failure_notice                               # 发送团失败通知
            Rails.logger.debug "团##{group.id}失败"
          end
        end
      end
    end
  end
end