class PlaylistsController < ApplicationController
  caches_action :index, :recent, :mostPlayed
  
  def index
    @playlists = Playlist.all.paginate(:page => params[:page], :per_page => 6)
  end
  
  def recent
	@playlists = Playlist.recent.paginate(:page => params[:page], :per_page => 6)
    render action: :index
  end
  
  def mostPlayed
	@playlists = Playlist.mostPlayed.paginate(:page => params[:page], :per_page => 6)
    render action: :index
  end
  
end
