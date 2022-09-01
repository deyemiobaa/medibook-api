class Doctor < ApplicationRecord
  belongs_to :user, required: false

  has_many :appointments
  has_many :user, through: :appointments
  validates :name, :specialization, :available_times, :hourly_rate, presence: true
end
