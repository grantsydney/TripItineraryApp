class TripRestaurantsController < ApplicationController


  def new
  end

  def create
    @trip_restaurant = TripRestaurant.create(trip_restaurant_params)
    flash[:added] = "Successfully added #{@trip_restaurant.restaurant.name} to your itinerary"
    redirect_to restaurant_path(@trip_restaurant.restaurant_id)
  end


  private

  def trip_restaurant_params
    params.require(:trip_restaurant).permit(:trip_id, :restaurant_id)
  end


end
