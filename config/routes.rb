Rails.application.routes.draw do
  root 'music_records#index'
  devise_for :users
  resources :music_records do
    member do
      get 'book'
    end
  end

  resources :carts, only: [] do
    member do
      post :checkout
      get :show
    end
  end

  resources :cart_items, only: [] do
    collection do
      post :add_to_cart
      patch :update_in_cart
      delete :remove_from_cart
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
