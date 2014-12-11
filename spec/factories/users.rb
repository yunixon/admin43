FactoryGirl.define do

  factory :user do
    name 'guest'
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 8) }
    role { :superadmin }

    after(:build) do |u|
      u.confirm!
      u.skip_confirmation_notification!
    end
  end

end
