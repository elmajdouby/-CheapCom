Rails.application.routes.draw do




  resources :producttypes
  resources :products
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :productimages, only: [:create]
  end
  resources :productimages, only: [:destroy]

  get '/products/buy/:id', to: 'products#buy', as: 'buyproduct'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users',   to: 'users#index'
  get "/dashboard" => "pages#home"

  get '/product/search/' , to: 'products#search', as: 'productsearch'

end
