Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :arts, only: [:index, :show]
  resources :art_items, only: [:index, :show]
end
