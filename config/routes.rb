Rails.application.routes.draw do
  # get "postulations/index"
  # get "postulations/show"
  # get "postulations/create"
  # get "publications/index"
  # get "publications/show"
  # get "publications/update"
  # get "publications/create"
  # resources :postulations
  resources :publications
  resources :postulations
  devise_for :users
  get "/index", to: "home#index"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
