class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
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

private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
