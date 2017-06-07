class SessionsController < ApplicationController
  def new 
  end
  def create
    user = Artist.find_by(login_id: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :back, flash: {success: 'Login success'}
    else
#      flash[:danger] = 'Invalid email/password combination'
      redirect_to :back, flash: {danger: 'Invalid email/password combination'}
    end
  end
  def destroy
    session.delete(:user_id)
    @login_artist = nil
    redirect_to :back, flash: {success: 'Logged out'}
  end

end
