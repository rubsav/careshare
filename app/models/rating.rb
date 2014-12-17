class Rating < ActiveRecord::Base
	validates :knowledge_rating, :support_rating, :comfort_rating, :accessibility_rating, :recommendation_rating,  presence: true
	
	belongs_to :user
	belongs_to :provider


	def single_user_rating
		# Rating.find(rating.user_id == @current_user).sum("knowledge_rating + support_rating + comfort_rating + accessibility_rating + recommendation_rating ")
	end

	def overall_rating 
		Rating.sum("knowledge_rating + support_rating + comfort_rating + accessibility_rating + recommendation_rating ") / (25 * Rating.count(:user_id).to_f) * 100
	end

end
