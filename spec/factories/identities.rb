FactoryGirl.define do

  factory :identity do
    association :user, factory: :user
    provider 'MyString'
    uid 'MyString'
  end

end
