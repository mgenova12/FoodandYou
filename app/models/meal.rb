class Meal < ApplicationRecord
  has_many :added_foods
  has_many :users, through: :added_foods
  has_many :foods, through: :added_foods

  def calorie_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.calories * added_food.quantity)
    end
      return total
  end  

  def protein_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.protein * added_food.quantity)
    end
      return total
  end
  
  def totalfat_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.totalfat * added_food.quantity)
    end
      return total
  end
  
  def sugar_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.sugar * added_food.quantity)
    end
      return total
  end
  
  def sodium_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.sodium * added_food.quantity)
    end
      return total
  end

  def cholesterol_meal_total
    total = 0

    added_foods.each do |added_food| 
      total += (added_food.food.cholesterol * added_food.quantity)
    end
      return total
  end

end
