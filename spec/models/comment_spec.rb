require 'rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.new
  it "should belongs to post" do
    should(belong_to(:post))
  end

  it "is not valid without username" do
    comment = Comment.new(body:"123")
    expect(comment).not_to be_valid
  end

  it "is not valid without body" do
    comment = Comment.new(username:"123")
    expect(comment).not_to be_valid
  end
end
