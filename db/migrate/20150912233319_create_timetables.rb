class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :section_id
      t.integer :subject_id
      t.integer :room_id
      t.integer :lecturer_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :staff_id

      t.timestamps
    end
  end
end
