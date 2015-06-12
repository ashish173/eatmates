# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_initialize_by(name: "Test user",
                       email: "testuser@eatmates.com",
                       gender: "male",
                       age: 23
                      ).update(password: "test123")
