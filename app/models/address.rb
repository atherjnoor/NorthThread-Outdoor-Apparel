class Address < ApplicationRecord
  belongs_to :user
  belongs_to :province

  validates :address_line1, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
end
