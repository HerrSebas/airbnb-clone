require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating 12 fake flats"
12.times do
  Flat.create(
    title: Faker::Book.title,
    location: Faker::Nation.capital_city,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    description: Faker::Lorem.sentence,
    capacity: Faker::Number.within(range: 1..10),
    category: "Room")
end
