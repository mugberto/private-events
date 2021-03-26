class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true

  def self.authenticate(username)
    find_by(username: username)
  end

  has_many :events
end
