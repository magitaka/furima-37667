require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  describe "購入登録" do
    context '購入登録できるとき' do
      it '問題なく登録できる' do
        expect(@buy_shipping).to be_valid
      end
      it "建物名が空でも購入できる" do
        @buy_shipping.building = ""
        expect(@buy_shipping).to be_valid
      end
    end

    context '購入登録できないとき' do
      it "郵便番号が必須" do
        @buy_shipping.post_code = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it "都道府県が必須" do
        @buy_shipping.shipment_address_id = 1
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Shipment address must be other than 1")
      end
      it "市区町村が必須" do
        @buy_shipping.city = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end
      it "番地が必須" do
        @buy_shipping.address = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が必須" do
        @buy_shipping.phone_number = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能" do
        @buy_shipping.post_code = '0000-000'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "電話番号は、9桁以下では登録できないこと" do
        @buy_shipping.phone_number = "00000000"
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it "電話番号は、12桁以上では登録できないこと" do
        @buy_shipping.phone_number = "0000000000000"
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it "電話番号は、半角数字以外が含まれている場合、登録できないこと" do
        @buy_shipping.phone_number = "0000000000000"
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it "user_idが空だと登録できない" do
        @buy_shipping.user_id = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @buy_shipping.item_id = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では購入できない" do
        @buy_shipping.token = ""
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
