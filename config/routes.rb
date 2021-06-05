Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show]

  resources :arts, only: [:index, :show]

  resources :art_items, only: [:index, :show] do
    resources :shopping_cart_items, only: [:create, :update]
  end
  post '/one_shopping_cart_item/', to: 'shopping_cart_items#create_one_item', as: 'one_shopping_cart_item'

  resources :shopping_carts, only: [:show]
  get '/paid_shopping_carts/', to: 'shopping_carts#paid_shopping_carts', as: 'paid_shopping_carts'

  # resources :orders, only: [:show, :create] do
  #   resources :payments, only: :new
  # end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  post '/favorites', to: 'arts#favor', as: 'favorites'
  get '/favorites', to: 'arts#all_favorites', as: 'all_favorites'
end
