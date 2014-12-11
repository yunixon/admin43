FactoryGirl.define do

  factory :newsline do
    name { Faker::Lorem.words(rand(2..5)).join(' ') }
    body 'MyString'
    status 'published'
  end

end
