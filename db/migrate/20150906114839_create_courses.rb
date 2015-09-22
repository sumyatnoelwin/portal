class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :related_field
      t.string :description

      t.timestamps
    end
  end
end
