require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new
  it "is valid with valid attributes" do
    post = Post.new(title:"123", body:"123", user: user)
    expect(post).to be_valid
  end

  it "is not valid without a title" do
    post = Post.new(title:"", body:"123", user: user)
    expect(post).not_to be_valid
  end

  it "is not valid without a body" do
    post = Post.new(title:"123", body:"", user: user)
    expect(post).not_to be_valid
  end

  it "should belongs to user" do
    should(belong_to(:user).without_validating_presence)
  end

  it "updates title" do
    post = Post.new(title:"123", body:"123", user: user)
    post.title = "321"
    expect(title).to eq("321")
  end
end
