class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipment_address
  belongs_to :delivery_date
  belongs_to :delivery_charge
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :category_id, numericality: { other_than: 1 }
    validates :item_status_id, numericality: { other_than: 1 }
    validates :shipment_address_id, numericality: { other_than: 1 }
    validates :delivery_date_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :image
    validates :item_name
    validates :item_info
    validates :price, numericality: {with: /\A[0-9]+\z/, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
