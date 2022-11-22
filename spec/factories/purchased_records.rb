FactoryBot.define do
  factory :purchased_record do
    
    association :user, :item
  end
end
