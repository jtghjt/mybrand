Rails.application.routes.draw do
  devise_for :customers
  root to: "items#index"
  resources :items, only: [:index, :show]
end
