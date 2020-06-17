Rails.application.routes.draw do
  root "products#index"
  get 		'/signup',		to: "customers#new"
  get 		'/login', 		to: "sessions#new"
  post 		'login',			to: "sessions#create"
 	delete 	'logout', 	to: "sessions#destroy"
  resources :products
  resources :categories
  resources :customers
  resources :inventories

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end

