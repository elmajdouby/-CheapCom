Rails.application.routes.draw do

  get 'payments/new'
  resources :products


  # get '/products/buy/:id', to: 'products#buy', as: 'buyproduct'


  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :productimages, only: [:create]
  end
  resources :productimages, only: [:destroy]

  get '/products/buy/:id', to: 'products#buy', as: 'buyproduct'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :producttypes

  get '/users',   to: 'users#index'
  get "/dashboard" => "pages#home"

  #Creating routes for orders

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end




end
