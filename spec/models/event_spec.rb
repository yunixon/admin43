require 'rails_helper'

describe Event do
  
  it 'is valid with an all columns' do
    expect(build(:event)).to be_valid
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }
  it { should validate_presence_of :location }
  it { should validate_presence_of :agenda }
  it { should validate_presence_of :address }
  
  it 'return event`s owner' do
  end

end
