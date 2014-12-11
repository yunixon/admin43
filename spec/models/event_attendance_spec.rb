require 'rails_helper'

describe EventAttendance do

  it { expect belong_to(:user).class_name('User') }
  it { expect belong_to(:event).class_name('Event') }

end
