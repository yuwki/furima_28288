class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX =/\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)[A-Za-z\d]{6,}\z/
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :first_name
    validates :last_name
  end
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: {with: VALID_KANA_REGEX }do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birth_date, presence: true
end

