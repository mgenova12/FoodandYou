class Api::V1::MealsController < ApplicationController
  def index 
    @meals = Meal.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end
  
  def show 
    @meal = Meal.find_by(id: params[:id])

    render 'show.json.jbuilder'
  end

  def create 

    @added_foods = AddedFood.where(user_id: current_user.id).where(status: 'added')

    @meal = Meal.new(
      user_id: current_user.id
    )

    @meal.save

    @added_foods.update(
      status: 'saved',
      meal_id: @meal.id
    )

    @meal.update(
      total_calories: @meal.calorie_meal_total,
      total_protein: @meal.protein_meal_total,
      total_totalfat: @meal.totalfat_meal_total ,
      total_sugar: @meal.sugar_meal_total,
      total_sodium: @meal.sodium_meal_total,
      total_cholesterol: @meal.cholesterol_meal_total
    )

    render 'show.json.jbuilder'
  end



end
