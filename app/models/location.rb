class Location < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  has_many :restaurants
  has_many :landmarks

end
