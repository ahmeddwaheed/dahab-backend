# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pools = Pool.create!([{name: 'GearUp2017', amount: '40000', monthly_amount: '4000', seat_number: '10', status: 'comming' },
        {name: 'FireUp2017', amount: '200000', monthly_amount: '20000', seat_number: '10', status: 'running' },
        {name: 'FireUp2016', amount: '4000', monthly_amount: '500', seat_number: '8', status: 'running' }])

users = User.create!([{name: 'hussien', password: '123456', password_confirmation: '123456', email: 'hussien@me.com'},
        {name: 'Waheed', password: '123456', password_confirmation: '123456', email: 'ahmed.waheed56@gmail.com'},
        {name: 'Mariam', password: '123456', password_confirmation: '123456', email: 'Mariam@me.com'}])

requests = Request.create!([{background: "ay klam", program: "fireup", reason:"klam brdo", user_id: 1, pool_id: 1, is_accepted: true},
        {background: "ay klam", program: "geerup", reason:"klam brdo", user_id: 1, pool_id: 2, is_accepted: false}])

# user_pool = UserPool.create!([{user_id: 2, pool_id:1, position: 2}, {user_id: 1, pool_id:1, position: 4}])

admins = Admin.create!([{name: "sayed", email: "sayed@hoba.com", password: "123456"}])



