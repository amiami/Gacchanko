Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  root "top#index"
  get "/home", to: "home#index"

  resources :packing_lists, only: [ :index, :show, :create ]
  resources :list_items, only: [ :update ]
  resources :kits, only: [ :index, :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]

  post "guest_login", to: "sessions#guest", as: :guest_login
end
