class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  #has_many :comments
  #has_many :orders
  
  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, presence: true, format: { with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)[A-Za-z\d]{6,}\z/}
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/}do
   validates :first_name_kana
   validates :last_name_kana
  end
  validates :birth_date, presence: true
end

