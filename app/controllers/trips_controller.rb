class TripsController < ApplicationController

  before_action :find_trip, only: [:show]

  def new
    @trip = Trip.new
    @locations = Location.all
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to @trip
  end

  def index
    @trips = Trip.all
  end

  def show
  end

  private
  def trip_params
    params.require(:trip).permit(:location_id, :user_id)
  end

  def find_trip
    @trip = Trip.find_by(id: params[:id])
  end


end
