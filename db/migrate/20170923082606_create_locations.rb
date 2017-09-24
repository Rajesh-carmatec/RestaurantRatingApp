class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :locality
      t.string :city
      t.integer :city_id
      t.string :latitude
      t.string :longitude
      t.string :zipcode
      t.integer :country_id
      t.string :locality_verbose
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
