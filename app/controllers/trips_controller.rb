class TripsController < ApplicationController

  before_action :find_trip, only: [:show, :destroy]

  def new
    @trip = Trip.new
    @locations = Location.all
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @trip = Trip.create(user_id: session[:user_id], location_id: trip_params[:location_id])
    session[:trip_id] = @trip.id
    # session[:my_future_trip] = trip_params[:location_id]
    redirect_to user_path(session[:user_id])
    # location_path(trip_params[:location_id])
  end

  def index
    @trips = Trip.all
  end

  def show
  end

  def destroy
    @trip.destroy
  end

  private
  def trip_params
    params.require(:trip).permit(:location_id, :user_id)
  end

  def find_trip
    @trip = Trip.find_by(id: params[:id])
  end


end
