require 'rails_helper'

describe 'Doctor', type: :model do
  it 'is valid attributes' do
    @user1 = User.create!(username: 'user1', password_digest: '12345678', role: 'regular')
    # doctor = Doctor.create!(username: "Bob", specialization: "Pediatr", available_times: "monday", hourly_rate: 9.00)
    doctor = Doctor.create!(name: 'Doctor1', specialization: 'eye specialist', available_times: 'monday-friday',
                            hourly_rate: 250)
    expect(doctor).to be_valid
  end
  it 'is not valid without a doctors name' do
    doctor = Doctor.create!(name: nil)
    expect(doctor).to_not be_valid
  end
  it 'is not valid without a doctors specializations' do
    doctor = Doctor.create!(specialization: nil)
    expect(doctor).to_not be_valid
  end
  it 'is not valid without a doctors hourly_rate' do
    doctor = Doctor.create!(hourly_rate: nil)
    expect(doctor).to_not be_valid
  end
end
