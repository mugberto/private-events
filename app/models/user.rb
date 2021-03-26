class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true

  def self.authenticate(username)
    find_by(username: username)
  end

  has_many :events
  has_many :attendances
  has_many :attended_events, source: :event, through: :attendances
end
