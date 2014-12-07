require 'rails_helper'

RSpec.describe Resume, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:resume)).to be_valid
  end

  it 'is invalid without a body' do
    resume = Resume.new(body: nil)
    expect(resume.valid?).to be_falsey
    expect(resume.errors[:body].size).to eq(2)
  end

  it 'is invalid with too short a body'  do
    resume = Resume.new(body: 'To')
    expect(resume).to_not be_valid
    expect(resume.errors[:body].size).to eq(1)
  end

  it 'is invalid without a status' do
    resume = Resume.new(status: nil)
    expect(resume.valid?).to be_falsey
    expect(resume.errors[:status].size).to eq(1)
  end

  it { is_expected.to belong_to(:user).class_name('User') }

end
