class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :destroy]
  PLACES_KEY = ENV['PLACES_KEY']

  def index
    @trip = Trip.find_by(id: session[:trip_id])
    if params[:search]
      @search_term = "#{params[:search]}  #{@trip.location.city}"
      @client = GooglePlaces::Client.new(PLACES_KEY)
      @places = @client.spots_by_query(@search_term)
    end
  end

  def custom
    #create && redirect
    @client = GooglePlaces::Client.new(PLACES_KEY)
    spot = @client.spot(params[:id])
    img_url = spot.photos[0].fetch_url(800)
    @place = Place.create(name: spot.name, rating: spot.rating, img_url: img_url, trip_id: session[:trip_id])
    redirect_to trip_path(session[:trip_id])
  end

  def show
  end

  def destroy
    @place.destroy
    redirect_to trip_path(session[:trip_id])
  end

  private

  def places_params
    params.require(:places).permit(:name, :rating, :trip_id)
  end

  def find_place
    @place = Place.find_by(id: params[:id])
  end

end
