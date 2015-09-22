class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :no
      t.string :room_name
      t.string :description

      t.timestamps
    end
  end
end
