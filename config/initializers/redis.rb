require 'forwardable'

class RedisNS
  extend Forwardable
  
  attr_reader :conn
  
  def initialize(namespace)
    @conn = Redis::Namespace.new(
        namespace,
        :redis => Redis.new(REDIS_CONFIG.symbolize_keys)
    )
  end
  
  def set(key, value, expire = nil)
    expire_seconds = expire.to_i
    value = JSON.dump(value) unless value.is_a?(String)
    conn.set(key, value)
    conn.expire(key, expire_seconds) if expire_seconds > 0
  end
  
  def get_obj(key)
    value = conn.get(key)
    value.nil? ? nil : JSON.parse(value)
  end
  
  def_delegators :conn, :get, :setbit, :getbit, :bitcount, :hset, :hget, :hmget, :hmset, :hvals,
   :hsetnx, :getrange, :sadd, :smembers, :mget, :keys, :del, :zadd, :zrange, :hgetall, :strlen, :bitop,
   :llen, :lpop, :lpush, :lrange, :rpush, :rpop, :expire
end

REDIS_CONN = RedisNS.new(CONFIG['redis_ns'])
