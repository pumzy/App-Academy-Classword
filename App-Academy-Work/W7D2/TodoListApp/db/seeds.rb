# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
todo_array = []

5.times do
  todo_array << { title: Faker::Food.ingredient, body: Faker::Pokemon.name, done: false}
end

Todo.create(todo_array);

# 5.times do
#   Todo.create({ title: Faker::Food.ingredient, body: Faker::Pokemon.name, done: false})
# end
