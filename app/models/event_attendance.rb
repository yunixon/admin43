class EventAttendance < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  validates_associated :event
  validates_associated :user

end
