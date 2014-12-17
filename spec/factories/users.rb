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
      role { :superadmin }
    end
    factory :sysadmin do
      role { :sysadmin }
    end
    factory :employer do
      role { :employer }
    end
  end
end
