class AddIndexAttendeeIdToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_index :attendances, :attendee_id
  end
end
