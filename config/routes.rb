Rails.application.routes.draw do

resources :users
resources :locations
resources :restaurants
resources :landmarks
resources :trips

get '/locations/:location_id/restaurants', to: "locations#location_restaurants"

get '/locations/:location_id/landmarks', to: "locations#location_landmarks"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
