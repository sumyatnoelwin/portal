class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :student_id
      t.integer :setion_id
      t.integer :subject_id
      t.string :result
      t.datetime :date
      t.string :remark

      t.timestamps
    end
  end
end
