class Doctor < ApplicationRecord
  belongs_to :user, optional: true

  has_many :reservations
  has_many :user, through: :reservations

<<<<<<< HEAD
  validates_presence_of :name
  validates_presence_of :specialization
  validates_presence_of :hourly_rate
=======
  validates :name, :specialization, :available_times, :hourly_rate, presence: true
>>>>>>> requests-specs
end
