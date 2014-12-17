FactoryGirl.define do

  factory :newsline do
    name { Faker::Lorem.words(rand(2..5)).join(' ') }
    body 'MyString'
    status 'unpublished'

    factory :invalid_newsline do
      name nil
    end
  end

end
