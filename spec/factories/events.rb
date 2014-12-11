FactoryGirl.define do
  
  factory :event do
    title { Faker::Lorem.words(rand(2..5)).join(' ') }
    start_date '2014-11-03 10:45:11'
    end_date '2014-11-03 10:45:11'
    location 'Kirov'
    agenda 'Povestka'
    address 'Moskovskaya 4'
    logo 'url of logo'
    association :organizer, factory: :user
    status 'published'
  end

end
