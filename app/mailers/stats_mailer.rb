class StatsMailer < ApplicationMailer
    default from: 'boom.senya@mail.ru'

    def send_stats(to_email)
        @post_count = Post.count
        @comment_count = Comment.count
        @last_published = Post.last.created_at
        mail(to: to_email, subject: 'Статистика из Active Admin')
      end

end
