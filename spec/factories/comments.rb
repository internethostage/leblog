FactoryGirl.define do
  factory :comment do
    association :post, factory: :post
    body      { Faker::Hacker.say_something_smart }
    user_id   { post.user_id }
  end
end
