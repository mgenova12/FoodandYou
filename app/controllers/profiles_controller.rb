class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @profiles = Profile.all
    @photos = Photo.where(user_id: current_user.id).order("created_at").last
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
    @profile = Profile.find_by(user_id: current_user.id)
    @photos = Photo.where(user_id: current_user.id).order("created_at").last
  end

  def update 
    @profile = Profile.find_by(user_id: current_user.id)    

    @profile.update(
      user_id: current_user.id,
      height: params[:height],
      weight: params[:weight],
      age: params[:age],
      geneder: params[:gender],
      activity_level: params[:activity_level]
    )

    redirect_to '/profile'
  end

end
