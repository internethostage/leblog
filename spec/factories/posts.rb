FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    association :category, factory: :category
    sequence(:title)  {|n| "#{Faker::Lorem.sentence} #{n}" }
    body              { Faker::Hacker.say_something_smart }
  end
end
