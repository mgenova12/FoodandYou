json.array! @Added_foods.each do |food|
  json.id food.id
  json.name food.name
  json.user_id food.user_id
  json.food_id food.food_id
  json.status food.status
  json.quantity food.quantity
  json.meal_id food.meal_id
end