class LandmarksController < ApplicationController

  before_action :find_landmark, only: [:show]

  def index
  end

  def show
  end


  private
  def landmark_params
    params.require(:landmark).permit(:name, :description, :img_url, :location_id)
  end

  def find_landmark
    @landmark = Landmark.find_by(id: params[:id])
  end
end
