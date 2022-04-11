Rails.application.routes.draw do
  devise_for :customers
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
  end
  resources :products, only: [:index, :show] do
    resources :comments, only: :create
  end
end
