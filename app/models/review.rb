class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :provider
	validates :email, :name, :comment,  presence: true 
end
