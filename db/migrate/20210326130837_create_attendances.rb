class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :attendee, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
    end
  end
end
