class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: {
      with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/,
      message: 'Include both letters and numbers'
    }

    validates :nickname, uniqueness: { case_sensitive: true }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'kana Full-width katakana characters' } do
      validates :last_kana
      validates :first_kana
    end

    validates :birthday
  end

  has_many :products
  has_many :buys
end
