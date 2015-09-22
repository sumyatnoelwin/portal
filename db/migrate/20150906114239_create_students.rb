class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :reg_no
      t.string :profile
      t.integer :gender
      t.datetime :dob
      t.string :nrc
      t.string :address
      t.string :email
      t.string :phone
      t.integer :section_id
      t.string :guardian
      t.string :relation

      t.timestamps
    end
  end
end
