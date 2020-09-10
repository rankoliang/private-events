# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  User.create(name: Faker::Name.unique.name)
end

users = User.all

users.each do |user|
  4.times do
    user.created_events.build(title: Faker::Lorem.word,
                              description: Faker::Lorem.sentence,
                              date: Faker::Date.backward(days: 1000),
                              location: Faker::Address.street_address)
  end
  4.times do
    user.created_events.build(title: Faker::Lorem.word,
                              description: Faker::Lorem.sentence,
                              date: Faker::Date.forward(days: 1000),
                              location: Faker::Address.street_address)
  end
  user.save
end

events = Event.all

users.each do |user|
  30.times do
    user.attended_events.build(event: events.sample)
  end
  user.save
end
