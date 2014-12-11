require 'rails_helper'

describe Newsline do
  
  it 'has a valid factory' do
    expect(build(:newsline)).to be_valid
  end

  it { expect validate_presence_of :name }
  it { expect validate_presence_of :body }

  it { expect ensure_length_of(:name).is_at_least(3) }
  it { expect ensure_length_of(:name).is_at_most(240) }
  it { expect ensure_length_of(:body).is_at_least(3) }
  it { expect ensure_length_of(:body).is_at_most(4000) }

end
