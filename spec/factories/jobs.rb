# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :job do
    association :employer, factory: :superadmin
    name { Faker::Lorem.words(rand(2..5)).join(' ') }
    body 'My big Text'
    status 'new'

    factory :invalid_job do
      name nil
    end
  end

end
