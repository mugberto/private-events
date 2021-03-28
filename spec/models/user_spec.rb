require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should be valid if username is present(presence)' do
      expect(User.new(username: 'anyusername')).to be_valid
    end
    it 'should be invalid if username is not present(presence)' do
      expect(User.new(username: nil)).to be_invalid
    end
    it 'should be invalid if a username created already exists(uniqueness)' do
      User.create(username: 'this_username')
      expect(User.new(username: 'this_username')).to be_invalid
    end
    it 'should be valid if a username created is not taken(uniqueness)' do
      expect(User.new(username: 'this_username')).to be_valid
    end
  end
end
