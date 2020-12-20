FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6)+"1a" }
    password_confirmation { password }
    first_name { Gimei.first.kanji }
    last_name { Gimei.last.kanji }
    first_name_kana { Gimei.first.katakana }
    last_name_kana { Gimei.last.katakana }
    birth_date { Faker::Date.between(from: '1990-09-23', to: '2014-09-30') }
  end
end
