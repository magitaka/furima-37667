require 'rails_helper'

RSpec.describe Shipping, type: :model do
  before do
    @shipping = FactoryBot.build(:shipping)
  end

  describe "購入登録" do
    context '購入登録できるとき' do
      it '問題なく登録できる' do
        expect(@shipping).to be_valid
      end
    end

    context '出品登録できないとき' do
      it "郵便番号が必須" do
        @shipping.post_code = ''
        @shipping.valid?
        binding.pry
      end
    end
  end
end
