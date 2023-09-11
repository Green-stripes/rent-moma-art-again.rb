Rails.application.routes.draw do
  devise_for :users
  root to: "artworks#index"

  resources :artworks, only: [:new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

end
