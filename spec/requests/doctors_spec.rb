require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  let!(:doctors) { FactoryBot.create_list(:doctor, 3) }
  before do
    @current_user = FactoryBot.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(true)
  end
  describe 'GET /doctors' do
    it 'returns all doctors' do
      get doctors_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'DELETE /doctors/:id' do
    it 'deletes a doctor' do
      expect do
        delete doctor_path(doctors.first)
      end.to change(Doctor, :count).by(-1)
    end
  end

  describe 'POST /doctors' do
    it 'creates a doctor' do
      expect do
        post doctors_path,
             params: { doctor: { name: 'Doctor', specialization: 'Specialization', picture: 'mydemopic.png',
                                 available_times: 'Weekdays 10am to 5pm', hourly_rate: '10' } }
      end.to change(Doctor, :count).by(1)
    end
  end
end
