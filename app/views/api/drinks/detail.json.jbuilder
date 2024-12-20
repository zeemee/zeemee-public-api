json.drinks [drink] do |drink|
  json.(drink, :name, :instructions, :image)
  json.container drink.container.name
  json.category drink.category.name
  json.ingredients drink.drink_ingredients do |drink_ingredient|
    json.name drink_ingredient.ingredient.name
    json.measurement drink_ingredient.measurement
  end
end
