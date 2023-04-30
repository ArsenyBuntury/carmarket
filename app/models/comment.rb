class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  validates :username, presence: true
  validates :body, presence: true
end
