class TransCare < ActiveRecord::Base

	class Doctor < TransCare;
	end


	class Counsellor < TransCare;
	end


	class Organization < TransCare;
	end

end
