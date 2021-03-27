class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User'

  validates :event_id, presence: true
  validates :attendee_id, presence: true
end
