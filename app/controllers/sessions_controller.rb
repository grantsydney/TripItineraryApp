class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new #GET to login
    render :new
  end

  def create #POST to login
    #handle the submission from our login form
    #log the user in

    #see if we have a user with provided info
    #if so, create session

    @user = User.find_by(username: params[:username])


    if  @user && @user.authenticate(params[:password])
      login_user(@user)
      #session[:user_id] = @user.id
      flash[:notice] = "Login Succesful! Welcome #{@user.username}"
      redirect_to @user
    else
      flash[:notice] = 'Invalid username or password!'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:trip_id)
    flash[:notice] = "Logout Succesful"
    redirect_to '/'
  end


end
