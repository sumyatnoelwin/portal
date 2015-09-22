class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :section_name
      t.integer :course_id
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps
    end
  end
end
