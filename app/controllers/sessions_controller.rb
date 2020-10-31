class SessionsController < ApplicationController
  

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Successful login"
      redirect_to user_path
    else
      flash[:danger] = "Invalid Credentials Given"
      render :new
    end
  end


  def destroy
    session.clear
    redirect_to root_path
  end
end
