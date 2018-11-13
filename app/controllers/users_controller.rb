class UsersController < ApplicationController

  before_action :find_user, only: [:show, :destroy]
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      login_user(@user)
      redirect_to new_trip_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @users = User.all
  end

  def show
    @trip = Trip.find_by(id: session[:trip_id])
    @my_trip_landmarks = TripLandmark.all.select do |tl|
      tl.trip_id == session[:trip_id]
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
