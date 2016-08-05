Rails.application.routes.draw do
  namespace :v1 do
    resources :recipes
    resources :users do
      collection do
        post :authenticate
      end
    end
  end
end
