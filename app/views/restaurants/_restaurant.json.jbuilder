json.extract! restaurant, :id, :restaurant_id, :name, :cuisines, :currency, :thumb, :has_online_delivery, :is_delivering_now, :has_table_booking, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
