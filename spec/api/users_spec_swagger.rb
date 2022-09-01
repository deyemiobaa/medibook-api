require 'swagger_helper'

describe 'Users API' do
  path '/signup' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            username: { type: :string },
            password: { type: :string },
            password_confirmation: { type: :string }
          }
        },
        required: %w[username password password_confirmation]
      }

      response '201', 'user created' do
        let(:user) { { username: 'test', password: 'test', password_confirmation: 'test' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: 'test' } }
        run_test!
      end
    end
  end

  path '/authenticate' do
    post 'Logs in a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            username: { type: :string },
            password: { type: :string }
          }
        },
        required: %w[username password]
      }

      response '200', '{token: "", role: "" username: ""}' do
        let(:user) { { username: 'test', password: 'test' } }
        run_test!
      end

      response '422', 'Unauthorized' do
        let(:user) { { username: 'test' } }
        run_test!
      end
    end
  end
end
