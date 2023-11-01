Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :campaigns, only: [:index]
    end
  end
end
