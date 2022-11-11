class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name,presence: true, format:{with: /\A[一-龥]+\z/ , message:"is invalid. Input full-width characters."}
  validates :first_name,presence: true, format:{with: /\A[一-龥]+\z/, message:"is invalid. Input full-width characters."}
  validates :last_name_kana,presence: true, format:{with: /\A[ァ-ヶー－]+\z/ , message: "is invalid. Input half-width characters."} 
  validates :first_name_kana,presence: true, format:{with: /\A[ァ-ヶー－]+\z/ , message: "is invalid. Input half-width characters."}
  validates :birth_date, presence: true

  has_many :items
end
