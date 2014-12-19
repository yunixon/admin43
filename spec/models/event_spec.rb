require 'rails_helper'

describe Event do
  
  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  it { expect validate_presence_of :title }
  it { expect validate_presence_of :start_date }
  it { expect validate_presence_of :end_date }
  it { expect validate_presence_of :location }
  it { expect validate_presence_of :agenda }
  it { expect validate_presence_of :address }

  it { expect ensure_length_of(:title).is_at_least(3) }
  it { expect ensure_length_of(:location).is_at_least(3) }
  it { expect ensure_length_of(:address).is_at_least(3) }
  it { expect ensure_length_of(:title).is_at_most(240) }
  it { expect ensure_length_of(:location).is_at_most(240) }
  it { expect ensure_length_of(:address).is_at_most(240) }
  it { expect ensure_length_of(:agenda).is_at_least(3) }
  it { expect ensure_length_of(:agenda).is_at_most(4000) }

  it { expect have_many(:event_attendances) }
  it { expect have_many(:users).through(:event_attendances) }
  it { expect have_many(:pictures) }

  it { expect belong_to(:organizer).class_name('User') }
  
  it 'return event`s owner' do
  end

end
