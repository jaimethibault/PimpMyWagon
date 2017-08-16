Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pimped_cars#index'
  resources :pimped_cars, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update]
  mount Attachinary::Engine => "/attachinary"
end
