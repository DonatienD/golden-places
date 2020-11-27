require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

######################
## CLEAN CURRENT DB ##
######################
puts "######################
    Cleaning DB...
######################
"

# Destroy Bookings
bookings = Booking.all

bookings.each do |booking|
  booking.destroy
end

# Destroy Villas
villas = Villa.all

villas.each do |villa|
  villa.destroy
end

# Destroy Users
users = User.all

users.each do |user|
  user.destroy
end

puts "DB cleaned"
######################
## REBUILD CLEAN DB ##
######################
puts "
######################
    Rebuilding DB...
######################
"

puts "Creating users..."
# Seed Users
user1 = User.new(email: "hello@gmail.com", password: "azerty")
user1.save
user2 = User.new(email: "booking@gmail.com", password: "azerty")
user2.save
puts "... #{User.count}/2 users created.
"


# Seed Villas
puts "Creating villas..."

files = [
  'https://res.cloudinary.com/dnr2pkzzz/image/upload/v1606313173/ScenicDrive_StudioSchicketanz_MinimalSelect_29-800x600_rccxy6.jpg',
  'https://res.cloudinary.com/dnr2pkzzz/image/upload/v1606313174/ScenicDrive_StudioSchicketanz_MinimalSelect_1-1160x870_x0qgbh.jpg',
  'https://res.cloudinary.com/dnr2pkzzz/image/upload/v1606313170/ScenicDrive_StudioSchicketanz_MinimalSelect_23-800x611_u03jzu.jpg',
  'https://res.cloudinary.com/dnr2pkzzz/image/upload/v1606313168/ScenicDrive_StudioSchicketanz_MinimalSelect_20-800x600_fakx8p.jpg',
  'https://res.cloudinary.com/dnr2pkzzz/image/upload/v1606313168/ScenicDrive_StudioSchicketanz_MinimalSelect_12-800x600_komwqy.jpg'
]

villa1 = Villa.new(
  title: "Villa over the sea",
  description: "Gorgeous housing, with incredible view on the Bay Area",
  location: "San Francisco Bay",
  services: "Heliport, Jetski",
  price_per_night: 5000,
  number_of_bedrooms: 4,
  number_of_bathrooms: 4,
  number_of_beds: 10)
i = 0
files.each do |file|
  i += 1
  image = URI.open(file)
  villa1.photos.attach(io: image, filename: "villa1-img.png#{i}", content_type: 'image/jpg')
end
villa1.user = user1
villa1.save

puts "... #{Villa.count}/1 villas created.
"

# Seed Bookings
# puts "Creating bookings..."

# booking = Booking.new(
#   date: Date.today,
#   number_of_nights: 2,
#   is_accepted: false)
# booking.user = user2
# booking.villa = villa1
# booking.save

# puts "... #{Booking.count}/2 bookings created.
# "

puts "######################
   Seed completed ✅
######################
"

