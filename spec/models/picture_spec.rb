require 'rails_helper'

describe Picture do

  it 'has a valid factory' do
    expect(build(:picture)).to be_valid
  end

end
