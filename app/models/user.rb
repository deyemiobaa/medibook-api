class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  has_secure_password
  validates :username, :password, :password_confirmation, presence: true

  def admin?
    role == 'admin'
  end
end
