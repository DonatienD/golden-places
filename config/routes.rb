 Rails.application.routes.draw do
  devise_for :users
  root to: 'villas#home'
  get '/search', to: 'villas#search'
  resources :villas, only: [:new, :create]
  resources :villas, only: [:show] do
    resources :bookings, only: [:new, :create]
    # resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
end
