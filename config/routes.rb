Rails.application.routes.draw do
  get 'starts_up/new'
  # get "about",           to: "pages#about",      as: :about
  # get 'meetings/create'
  # get 'connections/create'
  # get 'startups/index'
  # get 'startups/show'
  # get 'startups/new'
  # get 'startups/create'
  # get 'investors/new'
  # get 'investors/update'
  # get 'investors/index', to: "investors#index"
  # get 'investors/show'
  devise_for :users
  root to: "pages#home"
  # get 'index', to: "pages#index"

  get 'investors/new', to: "investors#new"
  post 'investors', to: "investors#create"

  resources :users do
  resources :starts_up, only: [:new]

  resources :starts_up do
   resources :starts_up, only: [:index, :new, :create]
  end
  resources :starts_up, only: [:destroy]
  resources :starts_up, only: [:show, :edit, :update, :destroy]
end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
