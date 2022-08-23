<<<<<<< HEAD
RSpec.describe 'Doctor', type: :model do
    it "is valid attributes" do
        doctor = Doctor.new(name: "Nick", specialization: "Pediatric", available_times: "Afternoons", hourly_rate: 50.00)
        expect(doctor).to be_valid
    end
    it "is not valid without a doctors name" do
        doctor = Doctor.new(name: nil)
        expect(doctor).to_not be_valid
    end
    it "is not valid without a doctors specializations" do
        doctor = Doctor.new(specialization: nil)
        expect(doctor).to_not be_valid
    end
    it "is not valid without a doctors hourly_rate" do
        doctor = Doctor.new(hourly_rate: nil)
        expect(doctor).to_not be_valid
    end
end
=======
require 'rails_helper'

describe Doctor, type: :model do
  describe 'Doctor validation tests' do
    subject do
      @user1 = User.create!(username: 'user1', password_digest: '12345678', role: 'regular')

      # @user1 = User.create!(name: 'John', email: 'John@mail.com', password: '123456', password_confirmation: '123456')

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
>>>>>>> requests-specs
