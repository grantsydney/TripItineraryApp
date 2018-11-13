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
      redirect_to @user
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
    @location = Location.find(session[:my_future_trip])
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
