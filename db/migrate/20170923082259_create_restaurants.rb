class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.integer :restaurant_id
      t.string :name
      t.string :cuisines
      t.string :currency
      t.string :thumb
      t.boolean :has_online_delivery
      t.boolean :is_delivering_now
      t.boolean :has_table_booking

      t.timestamps
    end
  end
end
