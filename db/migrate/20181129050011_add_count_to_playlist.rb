class AddCountToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :count, :integer
  end
end
