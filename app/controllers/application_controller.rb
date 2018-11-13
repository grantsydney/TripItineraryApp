class ApplicationController < ActionController::Base
before_action :authorized
helper_method :current_user, :logged_in?


  #are we logged in?
  #are we allowed to see this page?
  #who is the user stored in our session at the moment?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
    #!! will coerce current user into a boolean
  end

  def authorized
    unless logged_in?
      flash[:notice] = "You must be logged in to see this page"
      redirect_to login_path
    end
  end

  def login_user(user)
    session[:user_id] = user.id
    #code
  end
end
