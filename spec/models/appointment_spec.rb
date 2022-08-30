require 'rails_helper'

describe Appointment, type: :model do
  describe 'validation tests; ' do
    subject do
      @user1 = User.create!(username: 'user1', password: '12345678', password_confirmation: '12345678', role: 'regular')
      @doctor = Doctor.create!(name: 'Doctor1', specialization: 'eye specialist', available_times: 'monday-friday',
                               hourly_rate: 250)
      Appointment.create!(date: DateTime.now, duration: 4, total: 100, user_id: @user1.id, doctor_id: @doctor.id)
    end
    before { subject.save }

    it 'dates should be present' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'duration should be present' do
      subject.duration = nil
      expect(subject).to_not be_valid
    end

    it 'total should be present' do
      subject.total = nil
      expect(subject).to_not be_valid
    end
  end
end
