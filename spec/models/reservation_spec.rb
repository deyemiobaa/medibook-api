require 'rails_helper'

describe Reservation, type: :model do
  describe 'Reservation validation tests' do
    subject do
      @user1 = User.create!(username: 'user1', password_digest: '12345678', role: 'regular')
      @doctor = Doctor.create!(name: 'Doctor1', specialization: 'eye specialist', available_times: 'monday-friday',
                               hourly_rate: 250)
      Reservation.create!(date: DateTime.now, duration: 4, total: 100, user_id: @user1.id, doctor_id: @doctor.id)
    end
    before { subject.save }

    it 'name of rservation dates should be present' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'Reservation duration should be present' do
      subject.duration = nil
      expect(subject).to_not be_valid
    end

    it 'Reservation total should be present' do
      subject.total = nil
      expect(subject).to_not be_valid
    end
  end
end
