# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :resume do
    association :user, factory: :superadmin
    name 'Sysadmin resume'
    body 'My big Text'
    status 'unpublished'

    factory :invalid_resume do
      name nil
    end
  end

end
