class PlaylistsController < ApplicationController
  caches_action :index, expires_in: 5.minute
  caches_action :mostPlayed, expires_in: 15.minute
  caches_action :recent, expires_in: 1.minute

  def index
    @playlists = Playlist.all
  end
  
  def recent
    @playlists = Playlist.recent
    render action: :index
  end
  
  def mostPlayed
    @playlists = Playlist.mostPlayed
    render action: :index
  end
  
end
