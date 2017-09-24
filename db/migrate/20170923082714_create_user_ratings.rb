class CreateUserRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ratings do |t|
      t.string :aggregate_rating
      t.string :rating_text
      t.string :rating_color
      t.string :votes
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
