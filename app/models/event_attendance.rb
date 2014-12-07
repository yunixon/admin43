class EventAttendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :user_id, uniqueness: { scope: :event_id }
  validates_associated :event
  validates_associated :user

  def self.join_event(user_id, event_id)
    create(user_id: user_id, event_id: event_id)
  end
end
