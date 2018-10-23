class StaticPagesController < ApplicationController
  def video_room
    @room = Room.find(params[:id])
  end
end
