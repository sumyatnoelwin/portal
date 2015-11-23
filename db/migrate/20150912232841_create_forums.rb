class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.string :description
      t.string :author_id
      t.datetime :date

      t.timestamps
    end
  end
end
