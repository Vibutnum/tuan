class Wechat::Invitation < ActiveRecord::Base

  def self.ranking_list(invitation_config, limit = 10)
    query = <<-SQL
      select c.name as name, c.pic as pic, count(open_id) as fans, inviter_id, max(i.created_at) as fans_time
      from wechat_invitations as i
      left join core_connections as c on c.identifier = i.inviter_id and c.site = "wechat_uxuan"
      where i.created_at >= "#{invitation_config['begin_time']}" and i.created_at <= "#{invitation_config['end_time']}"
      group by inviter_id
      order by fans desc, fans_time asc
      limit #{limit}
    SQL

    self.find_by_sql(query)
  end

  # 加上分页
  def self.my_fans(invitation_config, inviter_id)
    # query = <<-SQL
    #   select c.name as name, c.pic as pic, i.created_at as time, i.open_id as open_id
    #   from wechat_invitations as i
    #   left join core_connections as c on c.identifier = i.open_id and c.site = "wechat_uxuan"
    #   where i.inviter_id = '#{inviter_id}' and date(i.created_at) <= "#{END_TIME}"
    #   order by i.created_at desc
    # SQL
    #
    # self.find_by_sql(query)

    select("c.name as name, c.pic as pic, `wechat_invitations`.created_at as time, `wechat_invitations`.open_id as open_id").
    joins("LEFT JOIN core_connections as c ON c.identifier = `wechat_invitations`.open_id AND c.site = 'wechat_uxuan'").
    where("`wechat_invitations`.inviter_id = ? AND `wechat_invitations`.created_at >= ? AND `wechat_invitations`.created_at <= ?", inviter_id, invitation_config['begin_time'], invitation_config['end_time']).
    order("`wechat_invitations`.created_at desc")
  end
end
