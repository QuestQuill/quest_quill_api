Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :campaigns, only: [:index, :show, :create] do
          resources :towns, only: [:index, :show, :create]
        end
      end
    end
  end
end
