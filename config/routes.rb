Rails.application.routes.draw do
  resources :items
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
