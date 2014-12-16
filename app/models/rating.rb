class Rating < ActiveRecord::Base
	validates :knowledge_rating, :support_rating, :comfort_rating, :accessibility_rating, :recommendation_rating,  presence: true
	
	belongs_to :user
	belongs_to :provider

end
