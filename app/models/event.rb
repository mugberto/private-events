class Event < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :attendee
end
