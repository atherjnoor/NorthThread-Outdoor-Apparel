class AdminUser < ApplicationRecord
  attr_accessor :login

  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)&.downcase

    if login
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login }]).first
    else
      where(conditions.to_h).first
    end
  end
end
