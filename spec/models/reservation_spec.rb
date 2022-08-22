RSpec.describe 'Reservation', type: :model do
    it "is valid attributes" do
        reservation = Reservation.new(date: DateTime.now)
        expect(reservation).to be_valid
    end
    it "is not valid without a doctors name" do
        doctor = Reservation.new(name: nil)
        expect(reservation).to_not be_valid
    end
    it "is not valid without a doctors specializations" do
        doctor = Reservation.new(specialization: nil)
        expect(reservation).to_not be_valid
    end
    it "is not valid without a doctors hourly_rate" do
        doctor = Reservation.new(hourly_rate: nil)
        expect(reservation).to_not be_valid
    end
end