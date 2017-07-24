FactoryGirl.define do
  factory :idea do
    association :user, factory: :user
    title Faker::StarWars.quote
    description Faker::Hacker.say_something_smart

  end
end
