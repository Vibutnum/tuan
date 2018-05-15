sidekiq_redis_url = "redis://#{ REDIS_CONFIG['host'] }:#{ REDIS_CONFIG['port'] }"
sidekiq_redis_namespace = "uxuan_sidekiq"

Sidekiq.configure_server do |config|
  config.redis = { url: sidekiq_redis_url, namespace: sidekiq_redis_namespace }
end
 
Sidekiq.configure_client do |config|
  config.redis = { url: sidekiq_redis_url, namespace: sidekiq_redis_namespace }
end