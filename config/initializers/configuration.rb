CONFIG         = YAML.load(File.open(Rails.root.join("config", "config.yml")))
PAYMENT_CONFIG = CONFIG['payment']
OAUTH_CONFIG   = CONFIG['oauth']
REDIS_CONFIG   = CONFIG['redis']
DOMAIN_CONFIG  = CONFIG['domain']
DATA_CONFIG    = CONFIG['data']
MAILER_CONFIG  = CONFIG['mailer']
GA_CONFIG      = CONFIG['ga']

CORE_CONNECTION_SITE = 'wechat_uxuan'

# 默认分页数量
WillPaginate.per_page = 5