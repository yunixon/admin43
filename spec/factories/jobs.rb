# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    employer_id 1
    name 'MyString'
    body 'MyText'
    status 1
  end
end
