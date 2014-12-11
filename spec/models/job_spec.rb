require 'rails_helper'

describe Job do

  it 'has a valid factory' do
    expect(build(:job)).to be_valid
  end

  it { expect validate_presence_of :name }
  it { expect validate_presence_of :body }

  it { expect ensure_length_of(:name).is_at_least(3) }
  it { expect ensure_length_of(:name).is_at_most(240) }
  it { expect ensure_length_of(:body).is_at_least(3) }
  it { expect ensure_length_of(:body).is_at_most(4000) }

  it { expect belong_to(:employer).class_name('User') }

end
