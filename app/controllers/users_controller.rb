class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def new

  end

  def create
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

  end

  private
  def user_params
    params.require(:user).permit(:name, :username)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
