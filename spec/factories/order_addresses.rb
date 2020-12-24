FactoryBot.define do
  factory :order_address do
    post_code {"123-4567"}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city {Gimei.address.city.kanji}
    house_number {"テスト15-10"}
    building_name {"テスト903号室"}
    tel {"09012345678"}
  end
end