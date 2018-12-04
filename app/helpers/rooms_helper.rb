module RoomsHelper
  def cache_key_for_rooms(room)
    "rooms/#{room.id}/#{room.updated_at}/#{room.users.size}"
  end
end
