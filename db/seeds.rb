# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
file_path = './db/cocktail_recipes.json'

file_contents = File.read(file_path)

recipes = JSON.parse(file_contents)

recipes.each do |recipe|
  puts "Creating #{recipe['name']}"
  category = Category.find_or_create_by! name: recipe['category']
  container = Container.find_or_create_by! name: recipe['container']
  drink = Drink.find_or_create_by!(
    name: recipe['name'],
    category: category,
    container: container,
    image: recipe['image'],
    instructions: recipe['instructions']
  )

  recipe['ingredients'].each do |ingredient|
    ing = Ingredient.find_or_create_by! name: ingredient['name']

    DrinkIngredient.create! drink: drink, ingredient: ing, measurement: ingredient['measurement']
  end
end


