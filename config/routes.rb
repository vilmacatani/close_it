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
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # get 'index', to: "pages#index"

  get 'uikit', to: "pages#uikit", as: :uikit

  get 'investors/new', to: "investors#new"
  post 'investors', to: "investors#create"

  resources :users do
    resources :investors, only: %i[new create show]
  end

  get 'startups/:id/team', to: "startups#team", as: :startup_team
  resources :startups
  # get '/investors/new', to: "investors#new"
  # post 'investors', to: "investors#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
