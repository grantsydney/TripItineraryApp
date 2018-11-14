class TripLandmarksController < ApplicationController
  before_action :find_trip_landmark, only: [:destroy]

  def new
  end

  def create
    @trip_landmark = TripLandmark.create(trip_landmark_params)
    flash[:added] = "Successfully added #{@trip_landmark.landmark.name} to your itinerary"
    redirect_to landmark_path(@trip_landmark.landmark_id)
  end

  def destroy
    id = @trip_landmark.trip.id
    @trip_landmark.destroy
    redirect_to trip_path(id)
  end

  private

  def trip_landmark_params
    params.require(:trip_landmark).permit(:trip_id, :landmark_id)
  end

  def find_trip_landmark
    @trip_landmark = TripLandmark.find(params[:id])
  end

end
