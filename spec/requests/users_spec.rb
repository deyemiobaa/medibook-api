require 'rails_helper'

RSpec.describe 'users', type: :request do
  before do
    post '/signup', params: { user: {username: 'John Doe', password: '123456', password_confirmation: '123456' }}
  end
  describe 'POST /signup' do
    it 'signs up sucessfully' do
      expect(JSON.parse(response.body)['message']).to eq 'sign up succesful'
    end
  end

  describe 'POST /authenticate' do
    it 'return auth token' do
      post '/authenticate', params: { user: {username: 'John Doe', password: '123456' }}
      expect(JSON.parse(response.body)['token']).to be_present
    end
  end
end