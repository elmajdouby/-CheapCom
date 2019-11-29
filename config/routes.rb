Rails.application.routes.draw do

  resources :payments
  resources :rates
  resources :subscriptions
  resources :subscriptions do
    resources :payments #, only: [:new, :create ]
  end


  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/users',   to: 'users#index'


  devise_scope :user do
    get '/grant/users/:id/:role',   to: 'users/registrations#grant', as: 'users_grant'
    # post '/users/edit(.:format)',   to:'users/registrations#base64_avatar', as: 'edit_user_base64_avatar'
  end

  resources :members
  get '/members/:id/avatar(.:format)',   to:'members#avatar', as: 'edit_avatar'
  post '/members/:id/avatar(.:format)',   to:'members#post_avatar', as: 'post_avatar'

  resources :badges
  resources :types

# *******************************************************************************************************

  root  to: 'pages#home'

  resources :products
  resources :products do
    resources :productimages, only: [:create]
  end

  resources :productimages, only: [:destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/dashboard" => "pages#home"
  get "/charts", to: "pages#test", as: "charts"
  get "/testing" => "pages#test"

  #Creating routes for orders

  # resources :orders, only: [:show, :create] do
  #   resources :payments, only: [:new, :create]
  # end

  get '/product/search/' , to: 'products#search', as: 'productsearch'
  get '/product/drop' , to: 'products#aff' , as: "productdrop"
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
