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
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipment_address_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :image
    validates :item_name
    validates :item_info
    validates :price
  end
end
