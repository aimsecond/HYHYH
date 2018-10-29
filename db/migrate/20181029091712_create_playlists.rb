class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.integer :room_id
      t.string :link_1
      t.string :link_2
      t.string :link_3
      t.string :link_4
      t.string :link_5

      t.timestamps
    end
  end
end
