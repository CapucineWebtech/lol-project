Rails.application.routes.draw do
  # Set the root path to the home page
  root "home#index"

  # Authentication routes
  get    '/login',  to: 'sessions#new',     as: :login
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  # Resources for main models
  resources :users
  resources :teams do
    # Nested routes for team-related actions
    get 'players', on: :member
    get 'matches', on: :member
  end

  resources :players

  resources :matches do
    # Additional action for updating match results
    patch 'update_result', on: :member
  end

  # Resources for user management
  resources :users do
    member do
      patch :toggle_admin
    end
  end  

  # Dashboard route for admins
  get 'dashboard', to: 'dashboard#index'

  # Team rankings
  get 'rankings', to: 'teams#rankings'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end