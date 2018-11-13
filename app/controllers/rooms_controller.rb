class RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if User.exists?(id: @room.host_id)
      if @room.save
        @user = User.find(room_params[:host_id])
        @user.update_attribute('room_id', @room.id)
        redirect_to video_room_path(@room.id)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
  
  def destroy
    Room.find(params[:id]).destroy
    @user = current_user
    @user.update_attribute('room_id', nil)
    flash[:success] = "Room deleted"
    redirect_to root_path
  end
  
  
  private
    def room_params
      params.require(:room).permit(:admin_1, :admin_2, :host_id, :room_name, :link_1, :link_2, :link_3, :link_4, :link_5)
    end
end
