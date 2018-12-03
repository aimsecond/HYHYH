class AddUsersCountToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :users_count, :integer
  end
end
