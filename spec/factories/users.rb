FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username }
    role { 'user' }
    email { Faker::Internet.email }
    password_digest { "password" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

