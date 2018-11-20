class RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  
  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if User.exists?(id: @room.host_id)
      if @room.save
        @user = User.find(room_params[:host_id])
        @user.update_attribute('room_id', @room.id)
        ActiveUser.create(room_id: @room.id, user_count: 1)
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
    @delete_id = @user.room_id
    @user.update_attribute('room_id', nil)
    User.where(:room_id => @delete_id).update_all(room_id: nil)
    Message.where(:room_id => @delete_id).destroy_all
    ActiveUser.where(:room_id => @delete_id).destroy_all
    flash[:success] = "Room deleted"
    redirect_to root_path
  end
  
  def oldest
    @rooms = Room.oldest
    render action: :index
  end
  
  def recent
    @rooms = Room.recent
    render action: :index
  end
  
  def mostUser
    @rooms = Room.mostUser
    render action: :index
  end
  
  private
    def room_params
      params.require(:room).permit(:admin_1, :admin_2, :host_id, :room_name, :link_1, :link_2, :link_3, :link_4, :link_5)
    end
end
