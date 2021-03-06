Rails.application.routes.draw do

  get 'poi_bookings/create'
  devise_for :users, controllers: {sessions: "sessions"}
  root to: 'pages#home'

  get 'connections', to: 'pages#connections', as:'connections-test'
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'journey_results', to: 'pages#journey_results', as: 'journey_results'
  post 'journey_create', to: 'pages#journey_create', as: 'journey_create'
  get 'journey_connections', to: 'pages#journey_connections', as: 'journey_connections'

  get 'pois/index'
  post 'pois', to: 'pois#create', as: 'new_pois'
  patch 'poi_booking/:id', to: 'poi_bookings#update', as: 'poi_booking'

  get 'bookings', to: 'journeys#bookings', as: 'bookings'
  patch 'journeys/:id/archive', to: 'journeys#archive', as: 'archive'

  resources :journeys do
    resources :connections
  end
  resources :connections, only: %i[index update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
