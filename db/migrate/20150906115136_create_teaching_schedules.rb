class CreateTeachingSchedules < ActiveRecord::Migration
  def change
    create_table :teaching_schedules do |t|
      t.integer :lecturer_id
      t.integer :section_id
      t.integer :subject_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :total
      t.string :remark
      t.string :description

      t.timestamps
    end
  end
end
