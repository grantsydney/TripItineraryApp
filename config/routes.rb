Rails.application.routes.draw do

resources :users
resources :locations
resources :restaurants
resources :landmarks
resources :trips
resources :trip_landmarks



post '/users/:id', to: "users#show"

get '/locations/:location_id/restaurants', to: "locations#location_restaurants"

get '/locations/:location_id/landmarks', to: "locations#location_landmarks"


#custom session route for login
get '/login', to: 'sessions#new', as: :login
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
