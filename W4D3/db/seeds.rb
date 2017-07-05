# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.create( birth_date: Date.today-rand(10000),  color: "blue", sex: "M", name: "Catty", description: "#swagcat")

Cat.create( birth_date:  Date.today-rand(10000), color: "red", sex: "F", name: "Johnette", description: "#swagcat2")

CatRentalRequest.create(start_date: Date.today.prev_month, end_date: Date.today, cat_id: 1)

CatRentalRequest.create(start_date: Date.today.prev_month, end_date: Date.tomorrow, cat_id: 1)

User.create(user_name: "Bob", password_digest: "fasfqeaxcaafqeffa", session_token: "gascsdfewvdfas") 
