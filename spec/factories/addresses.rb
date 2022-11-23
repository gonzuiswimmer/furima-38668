FactoryBot.define do
  factory :address do
    post_number {123-4567}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city_town {Gimei.address.city.kanji}
    house_number {1-2-304}
    building {}
    phone_number {Faker::Number.leading_zero_number(digits: 10)}
    
    association :purchased_record
  end
end
