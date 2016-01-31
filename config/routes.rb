Rails.application.routes.draw do
  devise_for :users
  
  root to: 'static_pages#home'
  get 'users/new'

  #get 'sessions/new'
  #root to: "home#index"
  #get    'signup', to: 'users#new'
  # get    'login' , to: 'sessions#new'
  # post   'login' , to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  devise_scope :user do
    get    'signup', to: 'devise/registrations#new'
    get    'login' , to: 'devise/sessions#new'
    post   'login' , to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  
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
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end