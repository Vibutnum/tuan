require 'rails/all'

listen 13000, :tcp_nopush => false

worker_processes 6

pid "#{Rails.root}/tmp/pids/unicorn.pid"
stderr_path "#{Rails.root}/log/unicorn.log"
stdout_path "#{Rails.root}/log/unicorn.log"