Rails.application.routes.draw do
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

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
