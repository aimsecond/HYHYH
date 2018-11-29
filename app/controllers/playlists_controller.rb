class PlaylistsController < ApplicationController
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
