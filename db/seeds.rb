# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'mando', email: 'test@test.com', password: 'WERr1234')
Event.create!(name: 'sample event', datetime: '2015-06-07 11:12:13', location: '123 A St, Hayward, Ca', description: 'Sample Description', host: 'none')
