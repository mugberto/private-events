require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Associations' do
    it { should belong_to(:attendee) }
    it { should belong_to(:event) }
  end

  context 'Validations' do
    it { should validate_presence_of(:event_id) }
    it { should validate_presence_of(:attendee_id) }
  end
end
