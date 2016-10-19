# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.destroy_all



Beer.create!(name: "B1", category: "C1", user: User.last)
Beer.create(name: "B2", category: "C2", user: User.first)
Beer.create(name: "B3", category: "C3", user: User.first)
puts "#{Beer.count} beer added"
