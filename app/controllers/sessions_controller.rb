class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/dashboard'
      else
        flash[:warning] = 'Invalid email or password!'
        redirect_to '/login'
      end    
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
