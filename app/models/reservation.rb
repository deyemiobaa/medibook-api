class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :doctor, optional: true

  validates :date, presence: true, length: { in: 0..20 }
end
