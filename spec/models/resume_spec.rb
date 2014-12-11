require 'rails_helper'

describe Resume do

  it 'has a valid factory' do
    expect(build(:resume)).to be_valid
  end

  it { expect validate_presence_of :name }
  it { expect validate_presence_of :body }
  it { expect validate_presence_of :status }

  it { expect ensure_length_of(:name).is_at_least(3) }
  it { expect ensure_length_of(:name).is_at_most(240) }
  it { expect ensure_length_of(:body).is_at_least(3) }
  it { expect ensure_length_of(:body).is_at_most(4000) }

  it { expect belong_to(:user).class_name('User') }

end
