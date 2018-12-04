module PlaylistsHelper
  def cache_key_for_playlists(video)
    "playlists/#{video.id}/#{video.updated_at}/#{video.count}"
  end
end
