Rails.application.routes.draw do
  get 'pois/index'
  devise_for :users, controllers: {sessions: "sessions"}
  root to: 'pages#home'
  get 'test', to: 'pages#test', as:'test'
  get 'connections', to: 'pages#connections', as:'connections-test'
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'journey_results', to: 'pages#journey_results', as: 'journey_results_info'
  post 'journey_results', to: 'pages#journey_results', as: 'journey_results'
  # get 'journey_results', to: 'pages#journey_results'
  get 'journey_connections', to: 'pages#journey_connections', as: 'journey_connections'

  get 'bookings', to: 'journeys#bookings', as: 'bookings'
  patch 'journeys/:id/archive', to: 'journeys#archive', as: 'archive'

  resources :journeys do
    resources :connections
  end
  resources :connections, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
