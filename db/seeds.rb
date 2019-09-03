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
User.create(email: "diego@gmail.com", password: "Password", username: "Diego", avatar: ActionController::Base.helpers.asset_path("avatars/diego.jpg"))
User.create(email: "buck@gmail.com", password: "Password", username: "Buck", avatar: ActionController::Base.helpers.asset_path("avatars/buck.jpg"))
User.create(email: "manny@gmail.com", password: "Password", username: "Manny", avatar: ActionController::Base.helpers.asset_path("avatars/manny.jpg"))
User.create(email: "sid@gmail.com", password: "Password", username: "Sid", avatar: ActionController::Base.helpers.asset_path("avatars/sid.jpg"))

puts "Users were created......"
Journey.create(user: User.all.sample, name: "Lisbon to Paris - time for romance", start_city: "Lisbon, Portugal", end_city: "Paris, France", archived: false)
Journey.create(user: User.all.sample, name: "Copenhagen to Rome - easter holidays", start_city: "Copenhagen, Denmark", end_city: "Rome, Italy", archived: false)
Journey.create(user: User.all.sample, name: "Central Europe journey", start_city: "Warsaw, Poland", end_city: "Ljubljana, Slovenia", archived: true)
Journey.create(user: User.all.sample, name: "Easter travel", start_city: "Berlin, Germany", end_city: "Brussels, Belgium", archived: true)
Journey.create(user: User.all.sample, name: "Moving time...", start_city: "Madrid, Spain", end_city: "Bruxelles", archived: false)
Journey.create(user: User.all.sample, name: "Gotta get some goodies", start_city: "Sevilla", end_city: "Amsterdam", archived: false)
puts "Creating journeys......."
