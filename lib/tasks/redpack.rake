namespace :redpack do
  desc '初始化红包列表到redis中'
  task make_pack: :environment do
    Wechat::Redpack.make_pack_list
    Wechat::Redpack.show_pack_list
  end

  desc '查询所有成功发放的红包状态并更新数据库'
  task query: :environment do
    Wechat::Redpack.wechat_query
  end  

  desc '抽奖'
  task lottery_draw: :environment do
  	Wechat::Redpack.lottery_draw
  end

end