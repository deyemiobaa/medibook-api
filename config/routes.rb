Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
