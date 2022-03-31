require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '問題なく登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "ニックネームが必須" do
        @user.nickname = ''
        @user.valid?
        binding.pry
      end
      it "emailが空では登録できない" do
      end
    end
  end
end
