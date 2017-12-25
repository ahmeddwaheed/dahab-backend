# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: 'hussien', password: '123456', email: 'hussien@me.com'}, {username: 'Waheed', password: '123456', email: 'Waheed@me.com'}, {username: 'Mostafa', password: '123456', email: 'mostafa@me.com'}])
