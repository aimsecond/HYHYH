class RemoveAvaterFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avater, :string
  end
end
