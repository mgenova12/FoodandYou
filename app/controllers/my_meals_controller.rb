class MyMealsController < ApplicationController
  def index
    
  end

  def show 
    @saved_foods = AddedFood.where(status: 'saved', meal_id: params[:id])

  end

end
