class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews
  	has_many :providers, through: :reviews

  	def full_name
  		"#{first_name} #{last_name}"
  	end
end
