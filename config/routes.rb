Rails.application.routes.draw do
  resources :reservations, only: [:index, :create, :destroy]
  resources :doctors
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
