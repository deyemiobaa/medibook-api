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