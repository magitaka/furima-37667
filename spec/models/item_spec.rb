require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe "出品登録" do
    context '出品登録できるとき' do
      it '問題なく登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it "商品画像を1枚つけることが必須" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明が必須" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "カテゴリーの情報が必須" do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態の情報が必須" do
        @item.item_status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status is not a number")
      end
      it "配送料の負担の情報が必須" do
        @item.delivery_charge_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it "発送元の地域の情報が必須" do
        @item.shipment_address_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment address is not a number")
      end
      it "発送までの日数の情報が必須" do
        @item.delivery_date_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end
      it "価格の情報が必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300円より少ない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9999999より多い" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end