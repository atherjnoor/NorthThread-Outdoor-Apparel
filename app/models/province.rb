class Province < ApplicationRecord
  validates :name, presence: true
  validates :abbreviation, presence: true
  validates :gst_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :pst_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :hst_rate, numericality: { greater_than_or_equal_to: 0 }

  has_many :addresses, dependent: :nullify
end
