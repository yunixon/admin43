FactoryGirl.define do
  
  factory :event do
    title 'My Event'
    start_date '2014-11-03 10:45:11'
    end_date '2014-11-03 10:45:11'
    location 'Kirov'
    agenda 'Povestka'
    address 'Moskovskaya 4'
    logo 'url of logo'
    organizer_id 1
    status 'published'
  end

end
