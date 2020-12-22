FactoryBot.define do
  factory :item do
    item_name { Faker::Book.title }
    introduction { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
