class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def create 
    @profile = Profile.new(
      user_id: current_user.id,
      height: params[:height],
      weight: params[:weight],
      age: params[:age],
      geneder: params[:gender],
      activity_level: params[:activity_level]
    )

    @profile.save

    @user = User.find_by(id: current_user.id)

    @user.update(
      profile: true
    )

    redirect_to '/profile'
  end

  def edit 

  end

  def update 

    @profile = Profile.find_by(user_id: current_user.id)    

    @profile.update(
      user_id: current_user.id,
      height: params[:height],
      weight: params[:weight],
      age: params[:age],
      geneder: params[:geneder],
      activity_level: params[:activity_level]
    )

    redirect_to '/profile'
  end

end
