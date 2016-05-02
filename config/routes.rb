Rails.application.routes.draw do
  get "/", to: "users#new"

  resources :users, only: [:new, :create, :show]
  # resources :games, only: [:show]
end
