require 'rails_helper'

RSpec.describe '/doctors', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Doctor.create! valid_attributes
      get doctors_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      doctor = Doctor.create! valid_attributes
      get doctor_url(doctor), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Doctor' do
        expect do
          post doctors_url,
               params: { doctor: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Doctor, :count).by(1)
      end

      it 'renders a JSON response with the new doctor' do
        post doctors_url,
             params: { doctor: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Doctor' do
        expect do
          post doctors_url,
               params: { doctor: invalid_attributes }, as: :json
        end.to change(Doctor, :count).by(0)
      end

      it 'renders a JSON response with errors for the new doctor' do
        post doctors_url,
             params: { doctor: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested doctor' do
        doctor = Doctor.create! valid_attributes
        patch doctor_url(doctor),
              params: { doctor: new_attributes }, headers: valid_headers, as: :json
        doctor.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the doctor' do
        doctor = Doctor.create! valid_attributes
        patch doctor_url(doctor),
              params: { doctor: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the doctor' do
        doctor = Doctor.create! valid_attributes
        patch doctor_url(doctor),
              params: { doctor: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested doctor' do
      doctor = Doctor.create! valid_attributes
      expect do
        delete doctor_url(doctor), headers: valid_headers, as: :json
      end.to change(Doctor, :count).by(-1)
    end
  end
end
