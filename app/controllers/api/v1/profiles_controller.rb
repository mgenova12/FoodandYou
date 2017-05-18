class Api::V1::ProfilesController < ApplicationController
  def index 
    @profiles = Profile.where(user_id: current_user.id)

    render 'index.json.jbuilder'
  end


end
