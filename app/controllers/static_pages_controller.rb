class StaticPagesController < ApplicationController
  def home
  end

  def lobby
  end
  
  def video_room
    @room = Room.find(params[:id])
  end
end
