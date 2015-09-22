class CreateStudentRegisters < ActiveRecord::Migration
  def change
    create_table :student_registers do |t|
      t.integer :student_id
      t.integer :section_id
      t.integer :tution_fees
      t.integer :exam_fees
      t.datetime :register_date
      t.boolean :complete_tf
      t.boolean :complete_ef
      t.integer :staff_id
      t.string :remark

      t.timestamps
    end
  end
end
