class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :admin_1
      t.integer :admin_2
      t.integer :host_id
      t.string :room_name
      t.string :link_1
      t.string :link_2
      t.string :link_3
      t.string :link_4
      t.string :link_5

      t.timestamps
    end
  end
end
