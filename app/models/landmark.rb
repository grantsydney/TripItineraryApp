class Landmark < ApplicationRecord
  belongs_to :location
  has_many :trip_landmarks
  has_many :trips, through: :trip_landmarks
end
