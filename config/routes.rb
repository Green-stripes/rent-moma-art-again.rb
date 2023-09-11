Rails.application.routes.draw do
  root to: "artworks#index"

  resources :artworks, only: [:new, :create, :show]
end
