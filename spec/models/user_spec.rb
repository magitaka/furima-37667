require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '問題なく登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "ニックネームが必須であること" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須であること" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは、6文字以上での入力が必須' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'お名前(全角)は、名字が必須' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end
      it 'お名前(全角)は、名前が必須' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
        @user.first_name = 'ｱｱｱ'
        @user.last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it 'お名前カナ(全角)は、名字が必須' do
        @user.first_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank", "First kana name 全角カタカナのみで入力して下さい")
      end
      it 'お名前カナ(全角)は、名前が必須' do
        @user.last_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank", "Last kana name 全角カタカナのみで入力して下さい")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須' do
        @user.first_name = 'ｱｱｱ'
        @user.last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it "生年月日が必須である" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
