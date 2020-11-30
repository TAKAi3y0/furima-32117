class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {
    with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/,
    message: 'Include both letters and numbers'
  }
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }
  validates :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: 'Full-width characters'
  }
  validates :first_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: 'Full-width characters'
  }
  validates :last_kana, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: 'kana Full-width katakana characters'
  }
  validates :first_kana, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: 'kana Full-width katakana characters'
  }
  validates :birthday, presence: true
end
