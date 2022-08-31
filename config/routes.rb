Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :appointments, only: [:index, :create, :destroy]
  resources :doctors, only: [:index, :create, :destroy]
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
