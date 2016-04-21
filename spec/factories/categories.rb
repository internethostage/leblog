FactoryGirl.define do
  factory :category do
    sequence(:title) {|n| "#{Faker::Hacker.adjective}#{n}"}
  end
end
