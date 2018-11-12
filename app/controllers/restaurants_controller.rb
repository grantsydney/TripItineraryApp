class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show]

  def index
  end

  def show
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :location_id)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end
end
