# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  order = Order.create(status: 'UNASSIGN')
  origin = Origin.create(latitude: Faker::Number.number(2), longtitude: Faker::Number.number(2), order: order )
  destination = Destination.create(latitude: Faker::Number.number(2), longtitude: Faker::Number.number(2), order: order )
  # order.items.create(name: Faker::Lorem.word, done: false)
  # order.items.create(name: Faker::Lorem.word, done: false)
end