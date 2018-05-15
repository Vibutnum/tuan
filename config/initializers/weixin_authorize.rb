$client ||= WeixinAuthorize::Client.new(OAUTH_CONFIG["wechat_uxuan"]["appid"], OAUTH_CONFIG["wechat_uxuan"]["secret"])
puts "微信连接初始化：#{$client.is_valid?}"

namespace = "uxuan:weixin_authorize"
redis = Redis.new(:host => REDIS_CONFIG["host"], :port => REDIS_CONFIG["port"], :db => REDIS_CONFIG["db"])

# 每次重启时，会把当前的命令空间所有的access_token 清除掉。
exist_keys = redis.keys("#{namespace}:*")
exist_keys.each{|key|redis.del(key)}

# Give a special namespace as prefix for Redis key, when your have more than one project used weixin_authorize, this config will make them work fine.
redis = Redis::Namespace.new("#{namespace}", :redis => redis)

WeixinAuthorize.configure do |config|
  config.redis = redis
end