class MyMealsController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end

  def show 
    @saved_foods = AddedFood.where(status: 'saved', meal_id: params[:id])

  end

end
