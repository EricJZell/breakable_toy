Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:index, :show] do
    resources :entries, only: [:new, :create, :show]
  end
  resources :locations, only: [:index]
  resources :countries, only: [:index]
end
