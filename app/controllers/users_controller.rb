class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, :except => []

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
			@user.update_attribute('avatar', 'https://i.blogs.es/f1870d/github-microsoft/1366_2000.jpg')
			log_in @user
			flash[:success] = "Create or join a room to watch!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attribute('avatar', params[:avatar])
		@user.update_attribute('email', params[:email])
		redirect_to @user
	end
	
	def join
	  @user = current_user
	  parameter = params[:search]
		if Room.exists?(id: parameter)
    		@user.update_attribute('room_id', parameter)
    		@active_user = ActiveUser.find_by_room_id(parameter)
    		@active_user.increment!(:user_count)
    		redirect_to video_room_path(@user.room_id)
    	else
      		flash.now[:danger] = "Invalid Room ID"
		end
	end
	
	def exit
		@user = current_user
		exit_room_id = @user.room_id
		@user.update_attribute('room_id', nil)
		@active_user = ActiveUser.find_by_room_id(exit_room_id)
    @active_user.decrement!(:user_count)
		flash[:success] = "Room exited"
		redirect_to root_path
	end

private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
