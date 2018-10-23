class RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to video_room_path(@room.id)
    else
      render 'new'
    end
  end
  
  private
    def room_params
      params.require(:room).permit(:admin_1, :admin_2, :host_id, :room_name, :link_1, :link_2, :link_3, :link_4, :link_5)
    end
end
