class AddTitleToExamLists < ActiveRecord::Migration
  def change
    add_column :exam_lists, :title, :string
  end
end
