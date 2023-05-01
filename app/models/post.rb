class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true

end
