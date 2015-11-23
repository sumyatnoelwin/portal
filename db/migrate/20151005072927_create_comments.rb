class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :student_id
      t.text :body
      t.references :forum, index: true

      t.timestamps
    end
  end
end
