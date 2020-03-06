FactoryBot.define do
  factory :user do
    sequence(:nickname) {Faker::Lorem.characters(number: 6)}
    sequence(:email) {Faker::Internet.email}
    password              {"password"}
    password_confirmation {"password"}
  end
end
