class MessageRelayJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast "rooms:#{message.room.id}", {
        username: message.user.username,
        content: message.content,
        room_id: message.room.id
      }
    end
end