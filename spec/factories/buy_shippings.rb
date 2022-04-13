FactoryBot.define do
  factory :buy_shipping do
    post_code            {"000-0000"}
    city                 {Faker::Address.city}
    shipment_address_id  {Faker::Number.between(from: 2, to: 48)}
    address              {Faker::Address.street_address}
    phone_number         {"00000000000"}
    token                {"tok_abcdefghijk00000000000000000"}
    building             {"あadcおbdhjfhv"}
  end
end
