class Restaurant < ApplicationRecord	
	
	has_one :location
	has_many :user_ratings #, dependent: :destroy
	belongs_to :user

	has_attached_file :image, styles: { medium: "400x600#"}, default_url: "/images/:style/missing.png"
  	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# Search criteria based on following fields
	searchable do
	    text :name
	    text :cuisines
	end

end