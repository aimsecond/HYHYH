# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_array = []                                                         
(1..1000).each do |num|                                                       
  user_array << User.create!(username: "User"+num.to_s, password: "password"+num.to_s, room_id: nil)                 
end 

room_array = []
@user_offset = user_array.first.id
(user_array).each do |user|
  if user.id >= @user_offset && user.id <= (500 + @user_offset)
    randName = SecureRandom.hex(5)
    @room = Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=" + randName.to_s + user.id.to_s, link_2: "https://www.youtube.com/watch?v=" + randName.to_s + user.id.to_s)
    room_array << @room
    User.find(user.id).update_attribute('room_id', @room.id)
  elsif user.id > (500 + @user_offset) && user.id <= (800 + @user_offset)
    @room = Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=kJQP7kiw5Fk")
    room_array << @room
    User.find(user.id).update_attribute('room_id', @room.id)
  elsif user.id > (800 + @user_offset) && user.id <= (1000 + @user_offset)
    @room = Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=g-N3s4sBlvs")
    room_array << @room
    User.find(user.id).update_attribute('room_id', @room.id)
  end
end
@room_offset = room_array.first.id
user_array_join = []
(1001..2000).each do |num|
  prng = Random.new
  room = prng.rand(0..250)
  user_array_join << User.create!(username: "User"+num.to_s, password: "password"+num.to_s, room_id: @room_offset + room)
end


Playlist.create!(link: "https://www.youtube.com/watch?v=kJQP7kiw5Fk", title: "Most Popular link", count:1 )
Playlist.create!(link: "https://www.youtube.com/watch?v=g-N3s4sBlvs", title: "Second Popular link", count:1 )
(room_array).each do |room|
  if room.id >= @room_offset && room.id <= (500 + @room_offset)
    Playlist.create!(link: room.link_1, title: "testlink in " + room.id.to_s, count:1 )
    Playlist.create!(link: room.link_2, title: "testlink2 in " + room.id.to_s, count:1 )
  elsif room.id > (500 + @room_offset) && room.id <= (800 + @room_offset)
    Playlist.find_by_link("https://www.youtube.com/watch?v=kJQP7kiw5Fk").increment!(:count)
  elsif room.id > (800 + @room_offset) && room.id <= (1000 + @room_offset)
    Playlist.find_by_link("https://www.youtube.com/watch?v=g-N3s4sBlvs").increment!(:count)
  end
end


(room_array).each do |room|
  ActiveUser.create!(room_id: room.id, user_count: 1)
  Message.create!(room_id: room.id, user_id: room.host_id, content: "my room is my house")
  Message.create!(room_id: room.id, user_id: room.host_id, content: "I am the king of my room and I control the paly and pause")
end
(user_array_join).each do |user_join|
  ActiveUser.find_by_room_id(user_join.room_id).increment!(:user_count)
end



