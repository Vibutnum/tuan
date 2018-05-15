namespace :daily_paper do
  desc 'daily paper'
  task perform: :environment do
    Rails.logger.debug "----- begin daily_paper:perform ------"
    daily_paper = DailyPaper.new
    data = daily_paper.results
    date = (daily_paper.send :real_time).strftime("%Y年%m月%d日")
    DailyPaperMailer.delay_for(1.second, retry: false).perform data, date
  end
end