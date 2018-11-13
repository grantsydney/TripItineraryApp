class LocationsController < ApplicationController

  before_action :find_location, only: [:show]


  def index
    @locations = Location.all
  end

  def location_landmarks
    @location = Location.find_by(id: params[:location_id])
    @landmarks = @location.landmarks
    
  end

  def location_restaurants
    @location = Location.find_by(id: params[:location_id])
    @restaurants = @location.restaurants
  end

  def show
  end

  private
  def location_params
    params.require(:location).permit(:city, :country)
  end

  def find_location
    @location = Location.find_by(id: params[:id])
  end


end
