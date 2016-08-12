Rails.application.routes.draw do
  namespace :v1 do
    resources :docs, only: [:index]
    resources :recipes
    resources :users do
      collection do
        post :authenticate
      end
    end
  end
end
