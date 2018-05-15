# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, 'production' 
set :output, "log/whenever.log"

every 5.minutes do
  rake "groupon:group:examine"
end

every 1.day, at: '9:58 am' do
  rake "daily_paper:perform"
end

every 60.minutes do
  rake "redpack:query"
end

every 1.day, at: '9:00 am' do
  rake "redpack:lottery_draw"
end
