class AddUserIdToUserRating < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_ratings, :user_id, :integer
  end
end