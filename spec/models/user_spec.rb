require 'rails_helper'

describe User, type: :model do
  describe 'User validation tests;' do
    subject do
      @user1 = User.create!(username: 'John', password: '123456', password_confirmation: '123456')
    end
    before { subject.save }

    it 'username should be present' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
end
