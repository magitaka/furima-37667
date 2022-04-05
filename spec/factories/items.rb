FactoryBot.define do
  factory :item do
    item_name           {'商品'}
    item_info           {'商品の説明'}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    item_status_id      {Faker::Number.between(from: 2, to: 7)}
    shipment_address_id {Faker::Number.between(from: 2, to: 48)}
    delivery_date_id    {Faker::Number.between(from: 2, to: 4)}
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
