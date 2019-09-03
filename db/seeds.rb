# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data..........."
User.destroy_all
Journey.destroy_all

puts "Creating users.........."
User.create(email: "1234@gmail.com", password: "Password", username: "1234", avatar: ActionController::Base.helpers.asset_path("avatars/1234.jpg"))
User.create(email: "diego@gmail.com", password: "Password", username: "Diego", avatar: ActionController::Base.helpers.asset_path("avatars/diego.jpg"))
User.create(email: "buck@gmail.com", password: "Password", username: "Buck", avatar: ActionController::Base.helpers.asset_path("avatars/buck.jpg"))
User.create(email: "manny@gmail.com", password: "Password", username: "Manny", avatar: ActionController::Base.helpers.asset_path("avatars/manny.jpg"))
User.create(email: "sid@gmail.com", password: "Password", username: "Sid", avatar: ActionController::Base.helpers.asset_path("avatars/sid.jpg"))
puts "Users were created......"

puts "Creating journeys......."
Journey.create(user: User.all.sample, name: "Lisbon to Paris - time for romance", start_city: "Lisbon, Portugal", end_city: "Paris, France", archived: false)
Journey.create(user: User.all.sample, name: "Copenhagen to Rome - easter holidays", start_city: "Copenhagen, Denmark", end_city: "Rome, Italy", archived: false)
Journey.create(user: User.all.sample, name: "Central Europe journey", start_city: "Warsaw, Poland", end_city: "Ljubljana, Slovenia", archived: true)
Journey.create(user: User.all.sample, name: "Easter trip", start_city: "Berlin, Germany", end_city: "Brussels, Belgium", archived: true)
Journey.create(user: User.all.sample, name: "Moving time...", start_city: "Madrid, Spain", end_city: "Bruxelles", archived: false)
Journey.create(user: User.all.sample, name: "Going north again", start_city: "Sevilla", end_city: "Amsterdam", archived: false)
Journey.create(user: User.all.sample, name: "Out by the Sea", start_city: "Bergen, Norway", end_city: "Inverness, Scotland, UK", archived: false)
Journey.create(user: User.all.sample, name: "Cradle of civilization", start_city: "Paris, France", end_city: "Heraklion, Greece", archived: false)
Journey.create(user: User.all.sample, name: "We will always have Sylt", start_city: "Bordeaux, France", end_city: "Westerland, Germany", archived: false)
Journey.create(user: User.all.sample, name: "Adriatic experience", start_city: "Naples,Italy", end_city: "Dubrovnik, Croatia", archived: false)
puts "Journeys were seeded...."
