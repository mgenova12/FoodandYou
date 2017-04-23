class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search_food]
      @food = Food.where("name = '#{params[:search_food]}'")
    else 
      @food = []
    end

  @foods = Unirest.get('https://api.nal.usda.gov/ndb/V2/reports?ndbno=01001&type=f&format=json&api_key=').body

  @test = @foods['foods'] 

  end

  

end
