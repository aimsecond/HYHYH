class RemoveRoomIdFromPlaylists < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :room_id, :integer
  end
end
