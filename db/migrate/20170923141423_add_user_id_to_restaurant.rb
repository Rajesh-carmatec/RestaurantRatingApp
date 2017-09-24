class AddUserIdToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :user_id, :integer
    remove_column :restaurants, :restaurant_id
  end
end
