Rails.application.routes.draw do
  
  get 'users/new'

  #get 'sessions/new'
  #root to: "home#index"
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  
  
  resources :users
  resources :sellers
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]
end