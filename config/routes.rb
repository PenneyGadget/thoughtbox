Rails.application.routes.draw do
  root to: "home#welcome"

  resources :users, only: [:new, :create]
  resources :links

  namespace :api do
    namespace :v1 do
      resources :links, defaults: {format: :json}
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
