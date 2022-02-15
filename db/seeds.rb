# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# create default user
User.create(
  email: 'constant@email.com',
  password: 'constant@email.com',
  name: 'Permanent Resolve',
)

# create other users
25.times do 
  name = Faker::Name.unique.name
  User.create(
    name: name,
    email: Faker::Internet.unique.email(name: name),
    password: 'default@email.com'
  )
end

# organize events
User.all.limit(7).each do |organizer|
  organizer.events.create(
    name: Faker::Fantasy::Tolkien.poem, 
    date: rand(10..35).days.from_now,
    location: Faker::Fantasy::Tolkien.location
  )
end

# create invites
to_invite = User.all.limit(15)
Event.all.each do |event|
  to_invite.each do |invitee|
    event.invitations.create!(
      organizer: event.creator,
      invitee: invitee
    )
  end
end

# create attendances
attending = User.where.not(id: to_invite.pluck(:id)).limit(7)
Event.all.each do |event|
  attending.each do |attendee|
    event.attendances.create!(
      attendee: attendee
    )
  end
end

