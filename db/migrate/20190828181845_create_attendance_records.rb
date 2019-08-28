class CreateAttendanceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_records do |t|
      t.integer :emp_id
      t.date :date
      t.time :time
    end
  end
end
