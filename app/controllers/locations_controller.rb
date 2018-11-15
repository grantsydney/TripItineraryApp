class LocationsController < ApplicationController

  before_action :find_location, only: [:location_landmarks, :location_restaurants]

  def location_landmarks
    @landmarks = @location.landmarks
  end

  def location_restaurants
    @restaurants = @location.restaurants
  end

  private
  def location_params
    params.require(:location).permit(:city, :country)
  end

  def find_location
    @location = Location.find_by(id: params[:location_id])
  end


end
