Rails.application.routes.draw do
  devise_for :users
  root to: 'pimped_cars#index'
  resources :pimped_cars, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update]
end
