Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]
end