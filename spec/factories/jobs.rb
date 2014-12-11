# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :job do
    association :employer, factory: :user
    name { Faker::Lorem.words(rand(2..5)).join(' ') }
    body 'My big Text'
    status 'published'
  end

end
