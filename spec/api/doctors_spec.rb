require 'swagger_helper'

describe 'Doctors API' do
  path '/doctors' do
    post 'Creates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          doctor: {
            name: { type: :string },
            specialization: { type: :string },
            picture: { type: :string },
            available_times: { type: :string },
            hourly_rate: { type: :number }
          }
        },
        required: %w[name specialization picture available_times hourly_rate]
      }

      response '201', 'doctor created' do
        let(:doctor) do
          { name: 'test', specialization: 'test', picture: 'test', available_times: 'test', hourly_rate: 100 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { username: 'test' } }
        run_test!
      end
    end
  end

  path '/doctors/{id}' do
    delete 'Deletes a doctor' do
      tags 'Doctors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :number

      response '200', 'doctor deleted' do
        let(:id) { 1 }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/doctors' do
    get 'Retrieves all doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'doctors retrieved []' do
        run_test!
      end
    end
  end
end
