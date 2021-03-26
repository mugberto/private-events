class Attendance < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  belongs_to :user, foreign_key: 'attendee_id'
end
