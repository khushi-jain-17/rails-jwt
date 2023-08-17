FactoryBot.define do
  factory :review do
    body { Faker::Lorem.sentence }
    star { Faker::Number.between(from: 1, to: 5) }
    user 
    movie 
    #association :user, factory: :user
    #association :movie
  end
end
