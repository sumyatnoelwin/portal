class AddDateToTimetables < ActiveRecord::Migration
  def change
    add_column :timetables, :date, :datetime
    add_column :timetables, :lecturer_id2, :integer
  end
end
