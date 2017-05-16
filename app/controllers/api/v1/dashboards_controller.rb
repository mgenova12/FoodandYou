class Api::V1::DashboardsController < ApplicationController
  def index
    @foods = Food.all 

    render 'index.json.jbuilder'
  end

  def search 
    @food = Food.find_by(name: params[:search])

    render 'search.json.jbuilder'
  end

  def addedFoodSearch
    @food = Food.find_by(id: params[:foodId])
    @quantity = params[:quantity]
    render 'addedFoodSearch.json.jbuilder'
  end



end
