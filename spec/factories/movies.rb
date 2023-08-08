FactoryBot.define do
  factory :movie do
    name { "MyString" }
    rating { 1 }
    description { "MyText" }
    director { "MyString" }
    user { nil }
    category { nil }
    released_on { "2023-08-08" }
  end
end