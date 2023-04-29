require 'rails_helper'

RSpec.describe User, type: :model do
user = User.new(email: "bob@bob.com", password:"123456")

describe "Validations" do
  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "User is invalid without password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  it "User is invalid without email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "should create micropost" do
  user = User.new(email: "bob@bob.com", password:"123456")
  user.save!
  user.microposts.create!(content: "Lorem ipsum")
  expect(user.microposts.count).to eq(1)
  end
end
end
