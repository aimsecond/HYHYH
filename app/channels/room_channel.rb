class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # stream_from "rooms:#{current_user.room_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def send_message(data)
    ActionCable.server.broadcast "room_channel",{
      username: "message.user.username",
      user_id: data["room_id"],
      content: data["content"]
    }
    # @room = Room.find(data["room_id"])
    # message = @room.messages.create(content: data["content"], user: current_user)
    # MessageRelayJob.perform_later(message)
  end
end
