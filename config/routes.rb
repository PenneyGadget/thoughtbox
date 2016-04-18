Rails.application.routes.draw do
  root to: "home#welcome"

  resources :users, only: [:new, :create]
  resources :links

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
