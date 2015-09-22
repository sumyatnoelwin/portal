class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
      t.integer :forum_id
      t.string :comment
      t.integer :author_id

      t.timestamps
    end
  end
end
