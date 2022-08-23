Rails.application.routes.draw do
  resources :items
  resources :doctors
  
  post 'authenticate', to: 'authentication#authenticate'
end
