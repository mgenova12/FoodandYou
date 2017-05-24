class PhotosController < ApplicationController
  before_action :authenticate_user!
  def index
    @photos = Photo.order('created_at')
  end

  def new
    @photo = Photo.new
    @last = Photo.where(user_id: current_user.id).order("created_at").last
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to '/profile'
    else
      render 'new.html.erb'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title, :user_id)
  end
end