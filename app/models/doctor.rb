class Doctor < ApplicationRecord
  has_many :reservations
  has_many :user, through: :reservations

  validates_presence_of :name
  validates_presence_of :specialization
  validates_presence_of :hourly_rate
end
