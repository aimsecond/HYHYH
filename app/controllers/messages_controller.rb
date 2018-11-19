class MessagesController < ApplicationController
  before_action :logged_in_user
  # before_action :validate_room
  before_action :get_messages

  def index
  end

  def create
    message = current_user.messages.build(message_params)
    message.room = current_user.room
    message.save
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def validate_room
      @room = Room.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
