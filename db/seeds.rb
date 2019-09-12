# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data..........."
Journey.destroy_all
User.destroy_all


puts "Creating users.........."
User.create(email: "1234@gmail.com", password: "Password", username: "1234", remote_avatar_url: "https://res.cloudinary.com/djkvtunck/image/upload/v1567775143/tb8vgsugb0sj48cqwymj.jpg")
User.create(email: "buck@gmail.com", password: "Password", username: "Buck", remote_avatar_url: "https://res.cloudinary.com/djkvtunck/image/upload/v1568303653/ns0up29sbmz4po3waila.jpg")
User.create(email: "diego@gmail.com", password: "Password", username: "Diego", remote_avatar_url: "https://res.cloudinary.com/djkvtunck/image/upload/v1568195029/fnyngjlmpjy650rqqnw5.jpg")
User.create(email: "manny@gmail.com", password: "Password", username: "Manny", remote_avatar_url: "https://res.cloudinary.com/djkvtunck/image/upload/v1568112199/izmemun1fyqjbi7vkgua.jpg")
User.create(email: "sid@gmail.com", password: "Password", username: "Sid", remote_avatar_url: "https://res.cloudinary.com/djkvtunck/image/upload/v1567509263/sid_2_tkeg3h.png")
puts "Users were created......"

# puts "Creating journeys.........."
# Journey.create(user: User.all.sample, name: "Lisbon to Paris - time for romance", start_city: "Lisbon, Portugal", end_city: "Paris, France", archived: false)
# Journey.create(user: User.all.sample, name: "Copenhagen to Rome - easter holidays", start_city: "Copenhagen, Denmark", end_city: "Rome, Italy", archived: false)
# Journey.create(user: User.all.sample, name: "Central Europe journey", start_city: "Warsaw, Poland", end_city: "Ljubljana, Slovenia", archived: true)
# Journey.create(user: User.all.sample, name: "Easter trip", start_city: "Berlin, Germany", end_city: "Brussels, Belgium", archived: true)
# Journey.create(user: User.all.sample, name: "Moving time...", start_city: "Madrid, Spain", end_city: "Bruxelles", archived: false)
# Journey.create(user: User.all.sample, name: "Going north again", start_city: "Sevilla", end_city: "Amsterdam", archived: false)
# Journey.create(user: User.all.sample, name: "Out by the Sea", start_city: "Bergen, Norway", end_city: "Inverness, Scotland, UK", archived: false)
# Journey.create(user: User.all.sample, name: "Cradle of civilization", start_city: "Paris, France", end_city: "Heraklion, Greece", archived: false)
# Journey.create(user: User.all.sample, name: "We will always have Sylt", start_city: "Bordeaux, France", end_city: "Westerland, Germany", archived: false)
# Journey.create(user: User.all.sample, name: "Adriatic experience", start_city: "Naples,Italy", end_city: "Dubrovnik, Croatia", archived: false)
# Journey.create(user: User.all.sample, name: "London to Lisbon", start_city: "London, UK", end_city: "Lisbon, Portugal", archived: false)
# Journey.create(user: User.all.sample, name: "Crossing the Pyrenées", start_city: "Brest, France", end_city: "Girona, Spain", archived: true)
# Journey.create(user: User.all.sample, name: "See the windows", start_city: "Santander, Spain", end_city: "Amsterdam, Netherlands", archived: false)
# Journey.create(user: User.all.sample, name: "Moving back", start_city: "Gibraltar, UK", end_city: "Copenhagen, Denmark", archived: false)
# Journey.create(user: User.all.sample, name: "Out by the sea", start_city: "Bergen, Norway", end_city: "Inverness, Scotland, UK", archived: false)
# Journey.create(user: User.all.sample, name: "Seasickening adventure", start_city: "Reykjavik, Iceland", end_city: "Hamburg, Germany", archived: false)
# Journey.create(user: User.all.sample, name: "Island to island", start_city: "Bastia, France", end_city: "Westerland, Germany", archived: false)
# Journey.create(user: User.all.sample, name: "Back to the cradle of civilization", start_city: "Moscow, Russia", end_city: "Heraklion, Greece", archived: false)
# Journey.create(user: User.all.sample, name: "Eastern adventure", start_city: "Bucharest, Romania", end_city: "Zagreb, Croatia", archived: false)
# Journey.create(user: User.all.sample, name: "From cold to colder", start_city: "Helsinki, Finland", end_city: "Zakopane, Poland", archived: false)
# puts "Journeys were created......"

puts "Connections"
