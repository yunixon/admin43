FactoryGirl.define do

  factory :event_attendance do
    association :user
    association :event
  end

end
