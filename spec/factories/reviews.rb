FactoryBot.define do
  factory :review do

    body { "MyString" }
    star { 1 }
    #user { nil }
    #movie { nil }
    association :user, factory: :user
    association :movie

  end
end
