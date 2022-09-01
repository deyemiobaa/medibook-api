require 'swagger_helper'

describe 'Appointments API' do
  path '/appointments' do
    post 'Creates a appointment' do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          appointment: {
            doctor_id: { type: :number },
            date: { type: :string },
            duration: { type: :number }
          }
        },
        required: %w[doctor_id date duration]
      }

      response '201', 'appointment created' do
        let(:appointment) { { doctor_id: 1, date: 'test', duration: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:appointment) { { doctor_id: 1 } }
        run_test!
      end
    end
  end

  path '/appointments/{id}' do
    delete 'Deletes a appointment' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :number

      response '200', 'appointment deleted' do
        let(:id) { 1 }
        run_test!
      end

      response '404', 'appointment not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/appointments' do
    get 'Retrieves all appointments' do
      tags 'Appointments'
      produces 'application/json'

      response '200', 'appointments retrieved []' do
        run_test!
      end
    end
  end
end
