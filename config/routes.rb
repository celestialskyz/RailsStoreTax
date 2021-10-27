Rails.application.routes.draw do

  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :carts, only: [:show,:destroy]
  resources :cart_items, only: [:create, :show, :delete]

  post 'cart_items/:id/add', to: 'cart_items#add_to_cart', as: 'add_plus1_item'
  delete 'cart_items/:id/delete', to: 'cart_items#remove_from_cart', as: 'remove_1_item'
  resources :products, only: [:index, :show]
end