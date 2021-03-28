require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should be valid if username is present' do
      user = User.new(username: 'anyusername')
      expect(user).to be_valid
    end
    it 'should be invalid if username is not present' do
      user = User.new(username: nil)
      expect(user).to be_invalid
    end
  end
end
