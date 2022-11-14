FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.characters(number:40)}
    details {Faker::Lorem.characters(number:1000)}
    category_id {Faker::Number.between(from:1, to:10 )}
    condition_id {Faker::Number.between(from:1, to:6)}
    shipping_charge_id {Faker::Number.between(from:1, to:2 )}
    prefecture_id {Faker::Number.between(from:1, to:47)}
    required_date_id {Faker::Number.between(from:1, to:3)}
    price {3000}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.webp'), filename:'test_image')
    end

  end
end
