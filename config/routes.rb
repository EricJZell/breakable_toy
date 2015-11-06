Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:index, :show] do
    resources :entries, except: [:index]
  end
  resources :entries, except: [:index] do
    resources :photos, only: [:create, :destroy]
  end
  resources :locations, only: [:index]
  resources :countries, only: [:index]
  resources :friendships, only: [:create, :update, :destroy, :index]
end
