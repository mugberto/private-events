class Event < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, source: 'User', through: :attendances
end
