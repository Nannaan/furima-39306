Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :records do
    resources :orders, only: [:index, :create]
  end
end