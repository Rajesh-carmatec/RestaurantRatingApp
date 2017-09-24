# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'httparty'

mumbai_restaurant_data = HTTParty.get(
							ENV.fetch("DELHI_RESTAURANTS_DATA_URL"), 
							:headers => {
								'user-key' => ENV.fetch("ZOMATO_API_KEY")
							}
						)

mumbai_restaurant_data = JSON.parse(mumbai_restaurant_data.body)

delhi_restaurant_data = HTTParty.get(
							ENV.fetch("MUMBAI_RESTAURANTS_DATA_URL"), 
							:headers => {
								'user-key' => ENV.fetch("ZOMATO_API_KEY")
							}
						)

delhi_restaurant_data = JSON.parse(delhi_restaurant_data.body)

mumbai_restaurant_data["restaurants"].each{ |r|
	Restaurant.create!(
		id: r["restaurant"]["id"],
		name: r["restaurant"]["name"],
		cuisines: r["restaurant"]["cuisines"],
		currency: r["restaurant"]["currency"],
		thumb: r["restaurant"]["thumb"],
		has_online_delivery: r["restaurant"]["has_online_delivery"],
		is_delivering_now: r["restaurant"]["is_delivering_now"],
		has_table_booking: r["restaurant"]["has_table_booking"]
	)

	Location.create!(
		address: r["restaurant"]["location"]["address"],
		locality: r["restaurant"]["location"]["locality"],
		city: r["restaurant"]["location"]["city"],
		city_id: r["restaurant"]["location"]["city_id"],
		latitude: r["restaurant"]["location"]["latitude"],
		longitude: r["restaurant"]["location"]["longitude"],
		zipcode: r["restaurant"]["location"]["zipcode"],
		country_id: r["restaurant"]["location"]["country_id"],
		locality_verbose: r["restaurant"]["location"]["locality_verbose"],
		restaurant_id: r["restaurant"]["id"],
	)

	UserRating.create!(
		aggregate_rating: r["restaurant"]["user_rating"]["aggregate_rating"],
		rating_text: r["restaurant"]["user_rating"]["rating_text"],
		rating_color: r["restaurant"]["user_rating"]["rating_color"],
		votes: r["restaurant"]["user_rating"]["votes"],
		restaurant_id: r["restaurant"]["id"]
	)
}


delhi_restaurant_data["restaurants"].each{ |r|
	Restaurant.create!(
		id: r["restaurant"]["id"],
		name: r["restaurant"]["name"],
		cuisines: r["restaurant"]["cuisines"],
		currency: r["restaurant"]["currency"],
		thumb: r["restaurant"]["thumb"],
		has_online_delivery: r["restaurant"]["has_online_delivery"],
		is_delivering_now: r["restaurant"]["is_delivering_now"],
		has_table_booking: r["restaurant"]["has_table_booking"]
	)

	Location.create!(
		address: r["restaurant"]["location"]["address"],
		locality: r["restaurant"]["location"]["locality"],
		city: r["restaurant"]["location"]["city"],
		city_id: r["restaurant"]["location"]["city_id"],
		latitude: r["restaurant"]["location"]["latitude"],
		longitude: r["restaurant"]["location"]["longitude"],
		zipcode: r["restaurant"]["location"]["zipcode"],
		country_id: r["restaurant"]["location"]["country_id"],
		locality_verbose: r["restaurant"]["location"]["locality_verbose"],
		restaurant_id: r["restaurant"]["id"],
	)

	UserRating.create!(
		aggregate_rating: r["restaurant"]["user_rating"]["aggregate_rating"],
		rating_text: r["restaurant"]["user_rating"]["rating_text"],
		rating_color: r["restaurant"]["user_rating"]["rating_color"],
		votes: r["restaurant"]["user_rating"]["votes"],
		restaurant_id: r["restaurant"]["id"]
	)
}

