FactoryGirl.define do
  factory :sysadmin, class: User do
    name "Mark Zukerberg"
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 8) }
    role {:sysadmin}
  end

  factory :employer, class: User do
    name "Intel Corporation"
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 8) }
    role {:employer}
  end

  factory :superadmin, class: User do
    name "Superadmin Yuri"
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 8) }
    role {:superadmin}
  end
end