require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.create(:user)).to be_valid
  end
  
  it "is valid with a first name, last name, email, and password" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
  
  it "is invalid without a first name" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  
  it "is invalid without a last name" do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  
  it "is invalid without a email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  
  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "tester@email.com")
    user = FactoryBot.build(:user, email: "tester@email.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "returns a user's full name as a string" do
    user = FactoryBot.build(:user)
    expect(user.name).to eq "John Smith"
  end
end
