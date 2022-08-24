Rails.application.routes.draw do
  resources :reservations
  resources :doctors
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
