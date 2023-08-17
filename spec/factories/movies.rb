FactoryBot.define do
  factory :movie do
    name { Faker::Movie.name }
    rating { Faker::Number.between(from: 1, to: 5) }
    description { Faker::Lorem.paragraph }
    director { Faker::Name.name }
    released_on { Faker::Date.between(from: '2024-01-01', to: '2024-12-31') }
    user 
    category 
    #association :user
    #association :category
  end
end

