30.times do
  title = Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: false)
  body = Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
  Post.create title: title, body: body, user_id: 1
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?
