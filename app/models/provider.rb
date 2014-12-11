class Provider < ActiveRecord::Base
	has_many :reviews
	has_many :users, through: :reviews
	
	class Doctor < Provider;
	end


	class Counsellor < Provider;
	end


	class Organization < Provider;
	end

end
