class StaticPagesController < ApplicationController
  def home
  end

  def lobby
    @all_rooms = Room.all
  end
  
  def video_room
    @room = Room.find(params[:id])
    @message = Message.new
  end
end
