class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.integer :course_id
      t.string :description

      t.timestamps
    end
  end
end
