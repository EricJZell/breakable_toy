Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:index, :show] do
    resources :entries, only: [:new, :create, :show]
  end
  get 'locations/update_countries' 
end
