every 1.day do
    runner "StatsMailer.send_stats('yeahwheel@gmail.com').deliver_now"
  end