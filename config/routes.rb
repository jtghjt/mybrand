Rails.application.routes.draw do
  devise_for :customers

  resources :customers, only: [:show, :edit, :update]
  
  root to: "items#index"
  
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  
  resources :products, only: [:index, :show] do
    resources :comments, only: :create
  end
end
