class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :post_code, null: false
      t.string :city, null: false
      t.integer :shipment_address_id, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :buy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
