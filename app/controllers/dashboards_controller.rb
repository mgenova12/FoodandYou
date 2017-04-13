class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search_food]
      @food = Food.where("name = '#{params[:search_food]}'")
    else 
      @food = []
    end
  end

  
end
