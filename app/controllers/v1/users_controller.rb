class V1::UsersController < ApplicationController
  get :index do
    params do
      param :limit, Integer, min: 1, max: 100, default: 10
      param :offset, Integer, min: 0, default: 0
    end
    presenter V1::UserPresenter
    request do
      present User.limit(params[:limit]).offset(params[:offset])
    end
  end

  get :show do
    params do
      param :id, Integer
    end
    presenter V1::UserPresenter
    request do
      present User.find(params[:id])
    end
  end

  post :create do
    form :user, V1::UserForm
    presenter V1::UserPresenter
    request do
      present @form.save!
    end
  end

  post :authenticate do
    params do
      param :username, String
      param :password, String
      param :user_agent, String
    end
    presenter V1::ApiTokenPresenter
    request do
      present ::AuthenticationService.new.authenticate(**declared.deep_symbolize_keys)
    end
  end
end
