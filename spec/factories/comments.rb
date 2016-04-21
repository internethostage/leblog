FactoryGirl.define do
  factory :comment do
    association :post, factory: :post
    sequence(:body)      {|n| "#{Faker::Hacker.say_something_smart} #{n}"}
    user_id   { post.user_id }
  end
end
