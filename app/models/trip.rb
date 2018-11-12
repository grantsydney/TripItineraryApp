class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :trip_restaurants
  has_many :restaurants, through: :trip_restaurants

  has_many :trip_landmarks
  has_many :landmarks, through: :trip_landmarks
end
