require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


puts 'cleaning db'

url_in = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredient_url = open(url_in).read
ingredients = JSON.parse(ingredient_url)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

url_co = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

cocktail_url = open(url_co).read
cocktails = JSON.parse(cocktail_url)

cocktails["drinks"].first(10).each do |cocktail|
  Cocktail.create!(name: cocktail["strDrink"])
end

cocktails["drinks"].first(10).each do |cocktail|
  Cocktail.create!(picture: cocktail["strDrinkThumb"])
end

puts "done"
