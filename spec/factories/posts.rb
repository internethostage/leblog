FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    title             { Faker::Lorem.sentence }
    body              { Faker::Hacker.say_something_smart }
    category_id       { 1 + rand(5) }
  end
end
