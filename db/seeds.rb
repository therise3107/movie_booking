# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   
#   Character.create(name: 'Luke', movie: movies.first)

@slots = [10,13,16,19]
@days = [Time.now.yesterday.day,Time.now.day,Time.now.tomorrow.day]
@month = Time.now.strftime("%m")

movies = Movie.create([{ name: 'Star Wars', fee: 100 }, 
					{ name: 'Lord of the Rings', fee: 100 },
					{ name: 'The Hobbit', fee: 100 },
					{ name: 'Harry Potter', fee: 100 }])

theaters = Theater.create([{name: 'DumberDoar'},
				{name: 'Elf'},
				{name: 'Giants'}
				])

@id = Movie.all.map(&:id)
Coupon.create(name: 'abcd', discount: 10)
Theater.all.each do |theater|
	@days.each do |day|
		@slots.each_with_index do |slot, i|
			Show.create(movie: Movie.find(@id[i]), theater: theater, start_time: Time.new(2016, @month, day,slot,0))
		end
	end
end