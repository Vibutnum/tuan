class DailyPaper
  attr_reader :normal_clients, :closely_gift_clients, :present_gift_clients, :total_clients
  
  def initialize
    @normal_clients         = self.class.send(:normal_clients).try(:keys)
    @present_gift_clients   = self.class.send(:present_gift_clients).try(:keys)
    @closely_gift_clients   = self.class.send(:closely_gift_clients).try(:keys)
    @unxuan_redpack_clients = self.class.send(:unxuan_redpack_clients).try(:keys)
    @total_clients          = @normal_clients.to_a + @unxuan_redpack_clients.to_a + @present_gift_clients.to_a + @closely_gift_clients.to_a
  end
  
  def results
    set_redis_data get_sql_data
    get_redis_data
  end
  
  class << self
    private
      def client_names
        normal_clients.merge(unxuan_redpack_clients).merge(present_gift_clients).merge(closely_gift_clients)
      end
      
      def normal_clients
        {
          "haitao"       => "商城",
          "haitao_touch" => "商城移动版",
          "uxuan"        => "团购"
        }
      end
      
      def present_gift_clients
        {
          "giver"        => "送礼（赠）",
          "receiver"     => "送礼（收）"
        }
      end
      
      def closely_gift_clients
        {
          "gift"         => "送礼（犒劳自己）"
        }
      end

      def unxuan_redpack_clients
        {
          "redpack"      => "团购（红包）"
        }
      end
      
      def deadline
        Date.yesterday
      end
  end
  
  private
    def get_sql_data(date = nil)
      date ||= real_time
      trades, users, amounts, totals, averages = {}, {}, {}, {}, {}
      Auction::Trade.select("client, count(id) as trades, count(distinct user_id) as users, sum(price) as total").
                     where(client: normal_clients + closely_gift_clients).
                     where("created_at >= ? AND created_at <= ?", date.beginning_of_day, date.end_of_day).
                     where.not(status: ['pay', 'cancel', 'freezed', 'punished', 'transfer', 'reject'], is_gift: 1).
                     group(:client).
                     each do |trade|
                       trades.store trade.client, trade.trades
                       totals.store trade.client, trade.total
                       averages.store trade.client, ((trade.total.to_f / trade.trades).round(2) rescue 0.00)
                       amounts.store trade.client, ((trade.total.to_f / trade.users).round(2) rescue 0.00)
                       users.store trade.client, trade.users
                    end

      # 团购红包订单
      query = <<-SQL
        select t.client as client,
          count(t.id) as trades,
          count(distinct user_id) as users,
          sum(-r.amount)/100 as total
        from auction_trades t
        inner join groupon_coupons c on t.coupon_id = c.id and c.is_redpack = 1
        inner join wechat_redpacks r on t.id = r.trade_id
        where t.client = 'uxuan'
          and t.status = 'complete'
          and t.created_at >= "#{Time.parse(date.beginning_of_day.to_s).strftime('%Y-%m-%d %H:%M:%S')}"
          and t.created_at <= "#{Time.parse(date.end_of_day.to_s).strftime('%Y-%m-%d %H:%M:%S')}"
        group by t.client
      SQL
      Auction::Trade.find_by_sql(query).
                     each do |tr|
                       trades.store "redpack", tr.trades
                       totals.store "redpack", tr.total
                       averages.store "redpack", ((tr.total.to_f / tr.trades).round(2) rescue 0.00)
                       amounts.store "redpack", ((tr.total.to_f / tr.users).round(2) rescue 0.00)
                       users.store "redpack", tr.users
                     end
      
      # 送礼赠送订单
      Auction::Trade.select("client, count(id) as trades, count(distinct user_id) as users, sum(price) as total").
                     where(client: "gift").
                     where("created_at >= ? AND created_at <= ?", date.beginning_of_day, date.end_of_day).
                     where(status: "complete").
                     where("is_gift = 1 AND gift_from IS NULL").
                     group(:client).
                     each do |tr|
                       trades.store "giver", tr.trades
                       totals.store "giver", tr.total
                       averages.store "giver", ((tr.total.to_f / tr.trades).round(2) rescue 0.00)
                       amounts.store "giver", ((tr.total.to_f / tr.users).round(2) rescue 0.00)
                       users.store "giver", tr.users
                     end
      
      # 送礼收礼订单
      Auction::Trade.select("client, count(id) as trades, count(id) as users, sum(price) as total").
                     where(client: "gift").
                     where("created_at >= ? AND created_at <= ?", date.beginning_of_day, date.end_of_day).
                     where("is_gift = 1 AND gift_from IS NOT NULL").
                     where.not(status: ['pay', 'cancel', 'freezed', 'punished', 'transfer', 'reject']).
                     group(:client).
                     each do |t|
                       trades.store "receiver", t.trades
                       totals.store "receiver", t.total
                       averages.store "receiver", ((t.total.to_f / t.trades).round(2) rescue 0.00)
                       amounts.store "receiver", ((t.total.to_f / t.users).round(2) rescue 0.00)
                       users.store "receiver", t.users
                     end
      
      total_clients.map do |client|
        {
          "date"     => date,
          "client"   => client,
          "trades"   => (trades[client] || 0),
          "users"    => (users[client] || 0),
          "amounts"  => (amounts[client] || 0.00),
          "totals"   => (totals[client] || 0),
          "averages" => (averages[client] || 0.00),
        }
      end
    end
    
    def get_redis_data
      REDIS_CONN.mget(*date_range).compact rescue []
    end
    
    def set_redis_data(value, date = nil)
      REDIS_CONN.set "#{ redis_keys_prefix }#{ date || real_time }", value, redis_expire_in
    end
    
    def redis_keys_prefix
      "daily_paper_"
    end
    
    def real_time
      @real_time ||= self.class.send(:deadline)
    end
    
    def days_ago
      4.days
    end
    
    def redis_expire_in
      1.month
    end
    
    def date_range
      real_time.downto(real_time - days_ago).to_a.map(&:to_s).map{ |date| "#{ redis_keys_prefix }#{ date }" }
    end
end