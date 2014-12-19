# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    name "My first picture"
    association :imageable, factory: :event
    imageable_type "Event"
  end
end
