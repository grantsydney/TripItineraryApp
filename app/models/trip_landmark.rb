class TripLandmark < ApplicationRecord
  belongs_to :trip
  belongs_to :landmark
end
