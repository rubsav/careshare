
User.create!(
	first_name: "admin",
	last_name: "user",
	email: "admin@example.com",
	password: "asdf",
	password_confirmation: "asdf"
)

puts "Creating Users"
puts "========================================================="

50.times do
	name = Faker::Name.name.split
	User.create!(
		first_name: name.first,
		last_name: name.last,
		email: Faker::Internet.email,
		password: "asdf",
		password_confirmation: "asdf"
	)

end

puts "Creating Providers"
puts "========================================================="
150.times do
  	name = Faker::Name.name.split

  	Provider.create!(
	    first_name: (name.first),
	    last_name: (name.last),
	    role: nil,
	    organization_name: Faker::Company.name,
	    full_address: nil,
	    phone_number: Faker::PhoneNumber.phone_number,
	    waiting_period: [*1..10].sample,
	    address_line1: Faker::Address.street_address,
	    address_line2: nil,
	    city: Faker::Address.city,
	    province: Faker::Address.state,
	    area_code: Faker::Address.zip_code
    )
    puts "Creating user named #{name}."
end


puts "Creating Reviews"
puts "========================================================="
150.times do
	reviewer_user = User.all.sample
	r = Review.create!(
		comment: Faker::Lorem.paragraph,
		user_id: User.all.sample.id,
		provider_id: Provider.all.sample.id,
		name: reviewer_user.full_name,
		email: reviewer_user.email
    )
    puts "Made review for #{r.provider.organization_name} by #{r.user.full_name}"
end


puts "Creating Ratings"
puts "========================================================="
150.times do
	r = Rating.create!(
		user_id: User.all.sample.id,
		provider_id: Provider.all.sample.id,
		knowledge_rating: [*0..4].sample,
		support_rating: [*0..4].sample,
		comfort_rating: [*0..4].sample,
		accessibility_rating: [*0..4].sample,
		recommendation_rating: [*0..4].sample
	)
	puts "Made rating of #{r.knowledge_rating} for #{r.provider.organization_name}"
end

# binding.pry