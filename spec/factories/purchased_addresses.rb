FactoryBot.define do
  factory :purchased_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_number {"123-4567"}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city_town {Gimei.address.city.kanji}
    house_number {"1-2-304"}
    building {"テストマンション"}
    phone_number {Faker::Number.leading_zero_number(digits: 10)}
    
    association :user
    association :item
  end
end
