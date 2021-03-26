class RemoveUserRefToAttendance < ActiveRecord::Migration[6.0]
  def change
    remove_reference :attendances, :user, foreign_key: true
  end
end
