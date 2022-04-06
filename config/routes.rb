Rails.application.routes.draw do
  devise_for :customers
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :products, only: [:index, :show]
end
