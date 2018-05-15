class DailyPaperMailer < ActionMailer::Base
  def perform(data, date)
    @data = data
    mail(to: MAILER_CONFIG['to']['daily_paper'], subject: "#{ date } 全球U选运营日报")
  end
end