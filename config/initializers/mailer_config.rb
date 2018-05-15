Rails.application.config.action_mailer.perform_deliveries = true
Rails.application.config.action_mailer.raise_delivery_errors = true
Rails.application.config.action_mailer.default_url_options = MAILER_CONFIG["default_url_options"].symbolize_keys
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = MAILER_CONFIG["smtp_settings"].symbolize_keys
Rails.application.config.action_mailer.default_options = MAILER_CONFIG["default_options"].symbolize_keys