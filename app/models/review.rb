class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :provider
	validates :email, :name, presence: true 
end
