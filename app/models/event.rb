class Event < ApplicationRecord
  belong_to :user, classname: 'User', foreign_key: 'user_id'
end
