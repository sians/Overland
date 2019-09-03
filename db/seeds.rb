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
puts "Data was erased........."

puts "Creating users.........."
User.create(email: "1234@gmail.com", password: "Password", username: "1234", avatar: ActionController::Base.helpers.asset_path("avatars/sid.jpg"))
User.create(email: "buck@gmail.com", password: "Password", username: "Buck", avatar: ActionController::Base.helpers.asset_path("avatars/buck.jpg"))
User.create(email: "diego@gmail.com", password: "Password", username: "Diego", avatar: ActionController::Base.helpers.asset_path("avatars/diego.jpg"))
User.create(email: "manny@gmail.com", password: "Password", username: "Manny", avatar: ActionController::Base.helpers.asset_path("avatars/manny.jpg"))
User.create(email: "sid@gmail.com", password: "Password", username: "Sid", avatar: ActionController::Base.helpers.asset_path("avatars/sid.jpg"))
puts "Users were created......"

puts "Creating journeys.........."
Journey.create(user: User.all.sample, name: "London to Lisbon", start_city: "London, UK", end_city: "Lisbon, Portugal", archived: false)
Journey.create(user: User.all.sample, name: "Crossing the Pyrenées", start_city: "Brest, France", end_city: "Girona, Spain", archived: true)
Journey.create(user: User.all.sample, name: "See the windows", start_city: "Santander, Spain", end_city: "Amsterdam, Netherlands", archived: false)
Journey.create(user: User.all.sample, name: "Moving back", start_city: "Gibraltar, UK", end_city: "Copenhagen, Denmark", archived: false)
Journey.create(user: User.all.sample, name: "Out by the sea", start_city: "Bergen, Norway", end_city: "Inverness, Scotland, UK", archived: false)
Journey.create(user: User.all.sample, name: "Seasickening adventure", start_city: "Reykjavik, Iceland", end_city: "Hamburg, Germany", archived: false)
Journey.create(user: User.all.sample, name: "Island to island", start_city: "Bastia, France", end_city: "Westerland, Germany", archived: false)
Journey.create(user: User.all.sample, name: "Back to the cradle of civilization", start_city: "Moscow, Russia", end_city: "Heraklion, Greece", archived: false)
Journey.create(user: User.all.sample, name: "Eastern adventure", start_city: "Bucharest, Romania", end_city: "Zagreb, Croatia", archived: false)
Journey.create(user: User.all.sample, name: "From cold to colder", start_city: "Helsinki, Finland", end_city: "Zakopane, Poland", archived: false)
puts "Journeys were created......"
puts "Connections"
