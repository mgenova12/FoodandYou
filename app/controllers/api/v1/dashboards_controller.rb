class Api::V1::DashboardsController < ApplicationController
  def index
    @foods = Food.all 

    render 'index.json.jbuilder'
  end

  def search 
    @food = Food.find_by(name: params[:search])

    render 'search.json.jbuilder'
  end

  def create 
    @added_food = AddedFood.new(
      user_id: current_user.id,
      food_id: params[:id], 
      status: "added",
      quantity: params[:quantity]
    )

    @added_food.save

    render 'added_foods.json.jbuilder'
  end

end
