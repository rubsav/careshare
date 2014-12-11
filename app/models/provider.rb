class Provider < ActiveRecord::Base


	class Doctor < Provider;
	end


	class Counsellor < Provider;
	end


	class Organization < Provider;
	end

	def full_address
		full_address = "#{address_line1} #{address_line2} #{city} #{province} #{area_code}"	
	end

end
