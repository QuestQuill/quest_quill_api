Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :campaigns, only: [:index, :show]
      resources :users, only: [:index, :show, :create]
      resources :towns, only: [:index, :show, :create]
    end
  end
end
