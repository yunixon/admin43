# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :resume do
    association :user, factory: :user
    name 'Sysadmin resume'
    body 'My big Text'
    status 'published'
  end

end
