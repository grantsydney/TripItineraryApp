class TripLandmarksController < ApplicationController


  def new
  end

  def create

    @trip_landmark = TripLandmark.create(trip_landmark_params)
    flash[:added] = "Successfully added #{@trip_landmark.landmark.name} to your itinerary"
    redirect_to landmark_path(@trip_landmark.landmark_id)
  end


  private

  def trip_landmark_params
    params.require(:trip_landmark).permit(:trip_id, :landmark_id)
  end


end
