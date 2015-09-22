class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.integer :gender
      t.datetime :dob
      t.string :nrc
      t.string :post
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
