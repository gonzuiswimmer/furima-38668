FactoryBot.define do
  factory :purchased_record do
    token {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
