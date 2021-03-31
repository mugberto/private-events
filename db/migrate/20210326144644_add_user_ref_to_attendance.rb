class AddUserRefToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :attendee_id, :integer
    add_foreign_key :attendances, :users, column: :attendee_id
  end
end
