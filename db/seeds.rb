# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do |i|
  Request.create(admin_id: 1, user_id: 1, pool_id: 1, is_accepted?: false, reason: "Some reason goes here.", background: "computer science", program: "Fireup")
end
1.times do |i|
  Request.create(admin_id: 1, user_id: 2, pool_id: 2, is_accepted?: false, reason: "Some reason goes here.", background: "computer science", program: "Fireup")
end
1.times do |i|
  Request.create(admin_id: 1, user_id: 3, pool_id: 3, is_accepted?: false, reason: "Some reason goes here.", background: "computer science", program: "Fireup")
end
1.times do |i|
  Request.create(admin_id: 1, user_id: 4, pool_id: 4, is_accepted?: false, reason: "Some reason goes here.", background: "computer science", program: "Fireup")
end
1.times do |i|
  Request.create(admin_id: 1, user_id: 5, pool_id: 5, is_accepted?: false, reason: "Some reason goes here.", background: "computer science", program: "Fireup")
end
