class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :ebook_name
      t.string :file
      t.string :about
      t.integer :category_id
      t.integer :uploader_id

      t.timestamps
    end
  end
end
