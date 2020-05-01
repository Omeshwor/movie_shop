Rails.application.routes.draw do
  root "products#index"
  get 		'/signup',		to: "customers#new"
  get 		'/login', 		to: "sessions#new"
  post 		'login',			to: "sessions#create"
 	delete 	'logout', 	to: "sessions#destroy"
  resources :products
  resources :categories
  resources :customers
end
