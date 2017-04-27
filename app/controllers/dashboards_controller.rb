class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search_food]
      @food = Food.find_by("name = '#{params[:search_food]}'")
    else 
      @food = Food.new
    end

  end

  

end
