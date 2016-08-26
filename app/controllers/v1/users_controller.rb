class V1::UsersController < ApplicationController
  get :index do
    params do
      param :page, Integer, min: 1
      param :results_per_page, Integer, min: 1, max: 100
      param :sort, String, values: %i(id username created_at)
      param :sort_reverse, Boolean
    end
    presenter V1::SearchResultsPresenter
    request do
      present User.search(**declared), with: V1::UserPresenter
    end
  end

  get :show do
    params do
      param :id, Integer
    end
    presenter V1::UserPresenter
    request do
      present User.find(params[:id]), type: :detail
    end
  end

  post :create do
    form :user, V1::UserForm
    presenter V1::UserPresenter
    request do
      present @form.save!, type: :detail
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
      present ::AuthenticationService.new.authenticate(**declared), type: :detail
    end
  end
end
