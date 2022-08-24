class Doctor < ApplicationRecord
  belongs_to :user, required: false
  # belongs_to :user, optional: true

  has_many :reservations
  has_many :user, through: :reservations

  validates :name, :specialization, :available_times, :hourly_rate, presence: true
end
