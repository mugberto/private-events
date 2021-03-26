class Attendance < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  belongs_to :attendee, class_name: 'User', foreign_key: 'attendee_id'
end
