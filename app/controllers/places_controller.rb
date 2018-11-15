class PlacesController < ApplicationController
  PLACES_KEY = ENV['PLACES_KEY']
  def index
  @trip = Trip.find_by(id: session[:trip_id])
   if params[:search]
      @search_term = "#{params[:search]}  #{@trip.location.city}"
      @client = GooglePlaces::Client.new(PLACES_KEY)
      @places = @client.spots_by_query(@search_term)
   end
 end
end
