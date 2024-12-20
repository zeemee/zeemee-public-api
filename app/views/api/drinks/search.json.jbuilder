json.drinks drinks do |drink|
  json.(drink, :id, :name, :image)
  json.category drink.category.name
end

json.totalCount total_count
