# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_initialize_by(
  name: "Test user 1",
  email: "testuser1@eatmates.com",
  gender: "male",
  age: 23
).update(password: "test123")

User.find_or_initialize_by(
  name: "Test user 2",
  email: "testuser2@eatmates.com",
  gender: "female",
  age: 23
).update(password: "test123")

user1 = User.find_by(name: 'Test user 1')
user2 = User.find_by(name: 'Test user 2')

Reservation.destroy_all

(1..45).each do |num|
  user = num <= 22 ? user1 : user2
  reservation = Reservation.create(
    restaurant_name:      'Malaka spice',
    place:                'Baner, Pune',
    time_of_reservation:  Time.now,
    proposition:          'Your dinner your choice!!!!',
    guests_number_pref:   2,
    gender_pref:          ['male', 'female'][rand(0..1)],
    liquor_pref:          'Yes',
    user:                 user
  )

  reservation.comments.create(
    message: "test comment no #{rand(0..99999)}",
    user: user
  )

end
