class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password_digest])
      # Log the user in and redirect to the user's show page.
      flash[:success] = 'Welcome to MusicDB'
      log_in user
      remember user
      redirect_to root_path
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render root_path
    end
  end


  #destroy session and log-out user
  def destroy
    log_out if logged_in?
  end
end
