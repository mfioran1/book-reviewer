class SessionsController < ApplicationController
  

  
  def create
      user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
        else
        flash[:message] = "Invalid Credentials Given"
        render :new
    end
  end

  def github_create
    @user = User.find_or_create_by(username: auth["info"]["nickname"])
    if !@user.password
      @user.password = SecureRandom.hex
    end
    @user.save
    log_in(@user)
    redirect_to user_path(@user)
  
  end


  def destroy
    session.clear
    redirect_to root_path
  end
end


private

  def auth
    request.env['omniauth.auth']
  end

