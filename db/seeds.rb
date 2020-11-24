# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(email: "hello@gmail.com", password: "azerty")
user1.save
user2 = User.new(email: "booking@gmail.com", password: "azerty")
user2.save

villa = Villa.new(
  title: "Villa over the sea",
  description: "Gorgeous housing, with incredible view on the Bay Area",
  location: "San Francisco Bay",
  services: "Heliport, Jetski",
  price_per_night: 15000,
  number_of_bedrooms: 8,
  number_of_bathrooms: 8,
  number_of_beds: 20)
villa.user = user1
villa.save


booking = Booking.new(
  date: Date.today,
  number_of_nights: 2,
  is_accepted: false)
booking.user = user2
booking.villa = villa
booking.save

