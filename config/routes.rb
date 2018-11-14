Rails.application.routes.draw do


resources :users
resources :locations
resources :restaurants
resources :landmarks
resources :trips
resources :trip_landmarks


get '/', to: 'welcome#index'


get '/locations/:location_id/restaurants', to: "locations#location_restaurants"

get '/locations/:location_id/landmarks', to: "locations#location_landmarks"

post 'landmarks/:id', to: "trip_landmarks#create"
post 'restaurants/:id', to: "trip_restaurants#create"

#custom session route for login
get '/login', to: 'sessions#new', as: :login
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: :logout

post '/users/:id', to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
