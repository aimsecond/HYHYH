class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.integer :room_id
      t.string :link

      t.timestamps
    end
  end
end
