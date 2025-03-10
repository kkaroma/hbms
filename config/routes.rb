Rails.application.routes.draw do
  # get "home/index"
  # resources :comments
  # resources :reviews
  # devise_for :users
  resources :categories
  get "landing" => "pages#landing"


  devise_for :users
  resources :books do
    resources :reviews do
      resources :comments, only: [ :create, :destroy ]
    end
  end
  root "home#index"


  # resources :wishlists, only: [ :index, :create, :destroy ] do
  #   post "move_to_books/:id", to: "wishlists#move_to_books", as: "move_to_books"
  # end

  resources :wishlists, only: [ :index, :create, :destroy ] do
    member do
      post :move_to_books  # This allows moving a wishlisted book to owned books
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
