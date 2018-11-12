# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#rails db:reset to reseed re migrate and everything !!!


User.create(name: "Sydney", username: "SydDawgg")
User.create(name: "Yoan", username: "YoanDawgg")

Location.create(city: "NYC", country: "USA")
Location.create(city: "Los Angeles", country: "USA")

Landmark.create(name: "Empire State Building", description: "Lights up at night", img_url: "empire.jpg", location_id: 1)
Landmark.create(name: "Hollywood Sign", description: "Don't Climb", img_url: "hollywood.jpg", location_id: 2)

Restaurant.create(name: "Blue Smoke", cuisine: "BBQ", location_id: 1)
Restaurant.create(name: "Urth Cafe", cuisine: "Earthy", location_id: 2)

Trip.create(location_id: 2, user_id: 1)
Trip.create(location_id: 1, user_id: 2)

TripLandmark.create(trip_id: 1, landmark_id: 1)
# User.first.trips.first.landmarks

TripRestaurant.create(trip_id: 2, restaurant_id: 2)
