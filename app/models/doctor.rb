class Doctor < ApplicationRecord
  has_many :reservations
  has_many :user, through: :reservations
end
