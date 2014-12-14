class Provider < ActiveRecord::Base
	validates :first_name, :last_name, :full_address, :address_line1, :city, :province, :area_code, :phone_number, :type, :waiting_period,  presence: true

	has_many :reviews
	has_many :users, through: :reviews

	mount_uploader :image, ImageUploader

	def full_address
		full_address = "#{address_line1} #{address_line2} #{city} #{province} #{area_code}"	
	end

	def self
      %w(Doctor Counsellor Organization)
    end

end

class Doctor < Provider
end


class Counsellor < Provider
end


class Organization < Provider
end