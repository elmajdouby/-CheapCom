Rails.application.routes.draw do



  resources :products

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root  to: 'products#index'
  resources :products do
    resources :productimages, only: [:create]
  end

  resources :producttypes do
    resources :products, only: [:index]
  end

  resources :productimages, only: [:destroy]

  get '/products/buy/:id', to: 'products#buy', as: 'buyproduct'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users',   to: 'users#index'
  get "/dashboard" => "pages#home"
  get "/charts", to: "pages#test", as: "charts"
  get "/testing" => "pages#test"

  #Creating routes for orders

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  get '/product/search/' , to: 'products#search', as: 'productsearch'
  get '/product/drop' , to: 'products#aff' , as: "productdrop"
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
