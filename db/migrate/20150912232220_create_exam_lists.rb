class CreateExamLists < ActiveRecord::Migration
  def change
    create_table :exam_lists do |t|
      t.integer :course_id
      t.integer :section_id
      t.integer :subject_id
      t.datetime :exam_date
      t.datetime :exam_time

      t.timestamps
    end
  end
end
