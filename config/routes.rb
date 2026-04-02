Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :admin_users, ActiveAdmin::Devise.config.merge(authentication_keys: [ :login ])
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :products, only: [ :index, :show ] do
    resources :product_reviews, only: [ :create ]
    post :toggle_wishlist, on: :member
  end

  resources :categories, only: [ :index, :show ]
  resources :wishlists, only: [ :index, :create, :destroy ]
  resources :discount_codes, only: [ :index, :create ]
  resources :addresses, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resource :cart, only: [ :show, :create, :update, :destroy ]
  resource :checkout, only: [ :show, :create ]
  resources :orders, only: [:index, :show] do
    resources :payments, only: [:new, :create]
  end
  get "/pages/:slug", to: "pages#show", as: :page

  root to: "products#index"
end
