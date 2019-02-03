Rails.application.routes.draw do


scope path: 'travelpal' do 
get '/', to: "welcome#index"

resources :users, only: [:new, :create, :show, :index]
resources :restaurants, only: [:index, :show]
resources :landmarks, only: [:index, :show]
resources :trips, only: [:new, :create, :show, :destroy]
resources :trip_landmarks, only: [:new, :create, :destroy]
resources :trip_restaurants, only: [:new, :create, :destroy]
resources :places, only: [:show, :destroy]


get '/places', to: "places#index"
post '/places/:id', to: "places#custom", as: :custom


post '/users/:id', to: "users#show"

get '/locations/:location_id/restaurants', to: "locations#location_restaurants"
get '/locations/:location_id/landmarks', to: "locations#location_landmarks"

post 'landmarks/:id', to: "trip_landmarks#create"
post 'restaurants/:id', to: "trip_restaurants#create"
post '/places', to: "places#create"

#custom session route for login
get '/login', to: 'sessions#new', as: :login
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: :logout


get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
