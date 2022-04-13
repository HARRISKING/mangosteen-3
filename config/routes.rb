Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :validation_codes, only: [:create]
      resources :session, only: [:create, :destroy]
      resources :me, only: [:show]
      resources :tags
    end
  end
end
