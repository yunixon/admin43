require 'rails_helper'

describe User, :type => :model do
 
  it "has a valid factory" do
    expect(FactoryGirl.build(:sysadmin)).to be_valid
  end

  it "has a valid factory" do
    expect(FactoryGirl.build(:employer)).to be_valid
  end

  it "has a valid factory" do
    expect(FactoryGirl.build(:superadmin)).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)  
    expect(user.valid?).to be_falsey
    expect(user.errors[:name].size).to eq(2)
  end

  it "is invalid with too short a name"  do
    user = User.new(name: "To")
    expect(user).to_not be_valid 
    expect(user.errors[:name].size).to eq(1)
  end

  it "is invalid without a role" do
    user = User.new(role: nil)  
    expect(user.valid?).to be_falsey
    expect(user.errors[:role].size).to eq(1)
  end

end