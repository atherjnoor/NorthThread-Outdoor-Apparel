Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resource :cart, only: [:show, :create, :update, :destroy]
  get '/pages/:slug', to: 'pages#show', as: :page

  root to: 'products#index'
end
