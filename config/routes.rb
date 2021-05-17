Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show] do
    resources :arts, only: [:index]
  end

  resources :arts, only: [:index, :show]

  resources :art_items, only: [:index, :show] do
    resources :shopping_cart_items, only: [:create]
  end
  resources :shopping_carts, only: [:show]
end
