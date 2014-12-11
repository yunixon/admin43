require 'rails_helper'

describe User do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { expect validate_presence_of :role }
  it { expect ensure_length_of(:description).is_at_most(4000) }
  
  it { expect have_many(:resumes) }
  it { expect have_many(:jobs).class_name('Job').with_foreign_key('employer_id') }
  it { expect have_many(:organized_events).class_name('Event').with_foreign_key('organizer_id') }
  it { expect have_many(:event_attendances) }
  it { expect have_many(:events).through(:event_attendances) }
  it { expect have_many(:identities) }

end
