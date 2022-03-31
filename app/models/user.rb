class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :nickname
    validates :email, format: {/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :birthday
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_kana_name, format: {with: /\A[\p{katakana} 一-&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
    validates :last_kana_name, format: {with: /\A[\p{katakana} 一-&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
end