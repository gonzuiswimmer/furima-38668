FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {encrypted_password}
    nickname {Faker::Name.name}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {Gimei.last.katakana}
    first_name_kana {Gimei.first.katakana}
    birth_date {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
