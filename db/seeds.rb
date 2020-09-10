10.times do
  User.create(name: Faker::Name.unique.name)
end

users = User.all

users.each do |user|
  4.times do
    user.created_events.build(title: Faker::Lorem.word,
                              description: Faker::Lorem.sentence,
                              date: Faker::Date.between(from: 200.days.ago, to: 200.days.from_now),
                              location: Faker::Address.street_address)
  end
  user.save
end

events = Event.all

events.each do |event|
  attended_events_params = users.sample(5).map do |user|
    { attendee: user, accepted: [true, false].sample }
  end
  event.attended_events.create(attended_events_params)
  event.save
end
