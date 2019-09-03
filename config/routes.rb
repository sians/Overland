Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'test', to: 'pages#test', as:'test'
  resources :journeys do
    resources :connections
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
