every 10.minutes do
    runner "StatsMailer.send_stats('yeahwheel@gmail.com').deliver_now"
  end