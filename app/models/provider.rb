class Provider < ActiveRecord::Base

	class Doctor < Provider;
	end


	class Counsellor < Provider;
	end


	class Organization < Provider;
	end

end
