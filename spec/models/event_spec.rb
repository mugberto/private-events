require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:attendees).class_name 'User'}
    it { should have_many(:attendances)}
  end
end
