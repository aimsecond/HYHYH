class CreateActiveUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :active_users do |t|
      t.integer :room_id
      t.integer :user_count

      t.timestamps
    end
  end
end
