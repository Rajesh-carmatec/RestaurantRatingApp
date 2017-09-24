class Location < ApplicationRecord

  belongs_to :restaurant

	# Search criteria based on following fields
  searchable do
  	text :address
  	text :city
  	text :locality_verbose	
  end
  
end