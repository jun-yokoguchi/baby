Rails.application.routes.draw do

  devise_for :sellers, controllers: {
    sessions:        'sellers/sessions',
    passwords:       'sellers/passwords',
    registrations:   'sellers/registrations'
  }
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  #mount Spree::Core::Engine, :at => '/users/seller/'
  
  devise_for :users, controllers: {
     session: 'users/sessions'
  }
  
  root to: 'static_pages#home'
  get 'static_pages/about'
  #get 'users/new'

  #get 'sessions/new'
  #root to: "home#index"
  #get    'signup', to: 'users#new'
  # get    'login' , to: 'sessions#new'
  # post   'login' , to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  #devise_scope :user 
  # do
  #   get    'signup', to: 'devise/registrations#new'
  #   get    'login' , to: 'devise/sessions#new'
  #   post   'login' , to: 'devise/sessions#create'
  #   delete 'logout', to: 'devise/sessions#destroy'
  # end
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  
  
#  resources :users
  resources :sellers
  resources :microposts
#  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end