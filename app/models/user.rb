class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews
	has_many :ratings
	has_many :providers
  	has_many :providers_reviewed, through: :reviews, source: :providers
  	has_many :providers_rated, through: :ratings, source: :providers


  	def full_name
  		"#{first_name} #{last_name}"
  	end

 #  	def single_user_rating
	# 	self.provider.ratings("knowledge_rating + support_rating + comfort_rating + accessibility_rating + recommendation_rating ")
	# end

	def rated?(provider)
		ratings.find_by(provider: provider)
	end

end
