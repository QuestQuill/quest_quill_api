Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        member do
          post 'upload_photo'
        end
        
        resources :campaigns, only: [:index, :show, :create, :update] do
          member do
            post 'upload_photo'
          end

          resources :towns, only: [:index, :show, :update, :create] do
            member do
              post 'upload_photo'
            end
          end

          resources :npcs, only: [:index, :show, :create, :update] do
            member do
              post 'upload_photo'
            end
          end

          resources :quests, only: [:index, :show, :create, :update] do
            member do
              post 'upload_photo'
            end
          end
        end
        
        get 'search', to: 'users/users_search#search', on: :collection
        post 'login', to: 'users/users_login#login', on: :collection
        patch 'update_token', to: "users/users_token#update", on: :collection
        post 'auth', to: "users/users_github#create", on: :collection
      end
    end
  end
end
