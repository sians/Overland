# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data..........."
User.destroy_all

puts "Creating users.........."
puts ActionController::Base.helpers.asset_path("avatars/sid.jpg")
User.create(email: "1234@gmail.com", password: "Password", username: "1234", avatar: ActionController::Base.helpers.asset_path("avatars/sid.jpg"))

puts "Users were created......"
