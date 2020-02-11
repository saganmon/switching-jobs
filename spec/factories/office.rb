FactoryBot.define do
  factory :office do
    sequence(:company_name) {Faker::Company.name}
    sequence(:overview) {Faker::Lorem.sentence}
    sequence(:ceo) {Faker::Name.name}
    sequence(:foundation) {Faker::Number.between(from: 1900, to: 2020)}
    sequence(:people) {Faker::Number.between(from: 10, to: 1000)}
    sequence(:area) {Faker::Address.city}
    sequence(:revenue) {Faker::Number.between(from: 1000, to: 10000)}
    sequence(:address) {Faker::Address.full_address}
    sequence(:url) {Faker::Internet.url}
  end
end