Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchases, only: [:index, :new, :create]
  end
  root 'items#index'
end
