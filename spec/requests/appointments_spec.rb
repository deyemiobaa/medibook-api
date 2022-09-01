require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  before do
    @doctor = FactoryBot.create(:doctor)
    @current_user = FactoryBot.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(true)
  end

  describe 'GET /appointments' do
    it 'returns all appointments' do
      get appointments_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end

  describe 'POST /appointments' do
    it 'creates a appointment' do
      expect do
        post appointments_path, params: { appointment: { date: '2020-01-01', duration: '1', doctor_id: @doctor.id } }
      end.to change(Appointment, :count).by(1)
    end
  end

  describe 'DELETE /appointments/:id' do
    it 'deletes a appointment' do
      @appointment = FactoryBot.create(:appointment, doctor: @doctor, user: @current_user)
      expect do
        delete appointment_path(@appointment)
      end.to change(Appointment, :count).by(-1)
    end
  end
end
