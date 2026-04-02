class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :product_reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
