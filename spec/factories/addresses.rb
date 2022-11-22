FactoryBot.define do
  factory :address do
    post_number {}
    prefecture_id {}
    city_town {}
    house_number {}
    building {}
    phone_number {}
    
    association :purchased_record
  end
end
