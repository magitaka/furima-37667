class BuyShipping
  include ActiveModel::Model
  attr_accessor :post_code, :city, :shipment_address_id, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :shipment_address_id, numericality: { other_than: 1 }
    validates :address
    validates :phone_number,format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, city: city, shipment_address_id: shipment_address_id, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end