require 'rails_helper'

describe Identity do

  it 'has a valid factory' do
    expect(build(:identity)).to be_valid
  end

  it { expect validate_presence_of :provider }
  it { expect validate_presence_of :uid }
  it { expect validate_uniqueness_of(:uid).scoped_to(:provider) }

  it { expect belong_to(:user).class_name('User') }

end
