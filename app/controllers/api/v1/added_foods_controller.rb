class Api::V1::AddedFoodsController < ApplicationController

  def index 
    @Added_foods = AddedFood.where(user_id: current_user.id, status: 'added');
    render 'index.json.jbuilder'
  end

  def show 
    @added_food = AddedFood.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create 
    @added_food = AddedFood.new(
      user_id: current_user.id,
      name: params[:name],
      food_id: params[:id], 
      status: "added",
      quantity: params[:quantity]
    )
    @added_food.save

    render 'show.json.jbuilder'
  end
  
  def destroy
    added_food = AddedFood.find_by(id: params[:id])

    if added_food.destroy
      render json: {success: 'Successfully destroyed'}
    else
      render json: {error: 'Something went wrong'}
    end
  end

end
