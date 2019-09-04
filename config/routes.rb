Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'test', to: 'pages#test', as:'test'
  post 'journey_results', to: 'pages#journey_results', as: 'journey_results'

  resources :journeys do
    resources :connections
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
