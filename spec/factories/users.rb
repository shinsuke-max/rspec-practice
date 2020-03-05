FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "John"
    last_name  "Smith"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password   "hogehoge"
  end
end
