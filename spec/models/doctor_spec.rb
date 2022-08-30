require 'rails_helper'

describe Doctor, type: :model do
  describe 'Doctor validation tests' do
    subject do
      @user1 = User.create!(username: 'John', password: '123456', password_confirmation: '123456')

      Doctor.create!(name: 'Doctor1', specialization: 'eye specialist', available_times: 'monday-friday',
                    hourly_rate: 250)
    end
    before { subject.save }

    it 'name of doctor should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Doctors specification should be present' do
      subject.specialization = nil
      expect(subject).to_not be_valid
    end

    it 'picture of doctor should be present' do
      subject.available_times = nil
      expect(subject).to_not be_valid
    end

    it 'description should be present' do
      subject.hourly_rate = nil
      expect(subject).to_not be_valid
    end
  end
end
