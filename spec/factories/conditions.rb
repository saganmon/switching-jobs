FactoryBot.define do
  factory :condition do
    sequence(:phase) {Faker::Number.between(from: 0, to: 2)}
    sequence(:result) {Faker::Number.between(from: 0, to: 2)}
    sequence(:date) {Faker::Date.between(from: Date.today, to: 1.year.from_now)}
    sequence(:memo) {Faker::Lorem.sentence}
  end
end