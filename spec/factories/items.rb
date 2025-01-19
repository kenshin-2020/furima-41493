FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_text { Faker::Lorem.paragraph }
    category_id { 2 }
    situation_id { 2 }
    shippingfee_id { 2 }
    prefecture_id { 2 }
    deliveryday_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
