class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :doctor, optional: true

  validates :date, presence: true
  before_save :set_total

  def set_total
    self.total = doctor.hourly_rate * duration
  end
end
