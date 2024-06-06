class User < ApplicationRecord
  rolify

  has_one :cart
  has_many :cart_items, through: :cart

  validates :first_name, :last_name, :phone, :email, presence: true
  validates :email, uniqueness: true
  validates :phone, length: { is: 10 }, numericality: { only_integer: true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
