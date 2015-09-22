class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :lecturer_name
      t.integer :gender
      t.datetime :dob
      t.string :nrc
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
