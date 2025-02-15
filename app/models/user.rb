class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
  validates :nickname,           presence: true
  validates :last_name,          presence: true,
                                 format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー－]+\z/, message: 'must be entered in full-width characters (Kanji, Hiragana, or Katakana)' }
  validates :first_name,         presence: true,
                                 format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー－]+\z/, message: 'must be entered in full-width characters (Kanji, Hiragana, or Katakana)' }
  validates :last_name_reading,  presence: true,
                                 format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'must be entered in full-width Katakana characters' }
  validates :first_name_reading, presence: true,
                                 format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'must be entered in full-width Katakana characters' }
  validates :birth_date,         presence: true

  has_many :items
  has_many :purchases
end
