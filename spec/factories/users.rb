FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    nickname { Faker::Name.name }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
