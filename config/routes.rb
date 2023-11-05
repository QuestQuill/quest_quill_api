Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :campaigns, only: [:index, :show] do
          resources :towns, only: [:index, :show, :create]
        end
        get 'search', to: 'users/users_search#search', on: :collection
      end
    end
  end  
end
