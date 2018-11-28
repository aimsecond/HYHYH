# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_array = []                                                         
(1..500).each do |num|                                                       
  user_array << User.create!(username: "User"+num.to_s, password: "password"+num.to_s, room_id: num)                 
end 

room_array = []
(user_array).each do |user|
  room_array << Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=g-N3s4sBlvs", link_2: "https://www.youtube.com/watch?v=kJQP7kiw5Fk")
end



