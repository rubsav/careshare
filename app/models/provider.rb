 class Provider < ActiveRecord::Base
	validate :first_name, unless: :is_organization?
	validate :last_name, unless: :is_organization?
	validates :full_address, :address_line1, :city, :province, :area_code, :phone_number, :type, :waiting_period,  presence: true
	

	has_many :reviews
	has_many :users, through: :reviews
	has_many :ratings

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

end

