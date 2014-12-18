 class Provider < ActiveRecord::Base
	validate :first_name, unless: :is_organization?
	validate :last_name, unless: :is_organization?
	validates :full_address, :address_line1, :city, :province, :area_code, :phone_number, :type, :waiting_period,  presence: true
	
	belongs_to :user

	has_many :reviews
	has_many :ratings
	has_many :users_that_reviewed_this, through: :reviews, source: :user
	has_many :users_that_rated_this, through: :ratings, source: :user

	before_save :capitalize_type

	mount_uploader :image, ImageUploader

	
	
	def full_address
		full_address = "#{address_line1} #{address_line2} #{city} #{province} #{area_code}"	
	end

	def is_organization?
		type == "Organization"
	end

	def capitalize_type
		type.capitalize!
	end

	def ratings_by_user(user)
		rating = ratings.find_by(user: user)
		rating.average_rating_by_user
	end


	def overall_rating 
		(self.ratings.sum("knowledge_rating + support_rating + comfort_rating + accessibility_rating + recommendation_rating ") / (20 * ratings.count(:user_id).to_f) * 100).round(0)
	end

end

