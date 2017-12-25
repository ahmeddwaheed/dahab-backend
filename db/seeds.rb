# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pools = Pool.create([{name: 'GearUp2017', amount: '40000', monthly_amount: '4000', seat_number: '10', status: 'comming' },
          {name: 'FireUp2017', amount: '200000', monthly_amount: '20000', seat_number: '10', status: 'running' }])

users = User.create([{username: 'hussien', password: '123456', email: 'hussien@me.com'}, {username: 'Waheed', password: '123456', email: 'Waheed@me.com'}, {username: 'Mostafa', password: '123456', email: 'mostafa@me.com'}])
