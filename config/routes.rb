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
  resources :shopping_carts, only: [:show]
  # resources :orders, only: [:show, :create] do
  #   resources :payments, only: :new
  # end
  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
