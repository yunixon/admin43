# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resume, class: Resume do
    user_id 1
    body "MyText"
    status {:published}
  end
end
