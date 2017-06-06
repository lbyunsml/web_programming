class SessionsController < ApplicationController
  def new 
  end
  def create
    user = Artist.find_by(id: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


end
