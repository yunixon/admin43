FactoryGirl.define do

  factory :user do
    name 'guest'
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 8) }
    role { :unsetuped }

    after(:build) do |u|
      u.confirm!
      u.skip_confirmation_notification!
    end

    factory :superadmin do
      name 'superadmin'
      role { :superadmin }
    end
    factory :sysadmin do
      name 'sysadmin'
      role { :sysadmin }
    end
    factory :employer do
      name 'employer'
      role { :employer }
    end
  end
end
