class V1::UsersController < ApplicationController
  get :index do
    presenter V1::UserPresenter
    request do
      users = User.all.limit(10)
      present users
    end
  end

  get :show do
    params do
      param :id, Integer
    end
    presenter V1::UserPresenter
    request do
      user = User.find(params[:id])
      present user
    end
  end

  post :create do
    form :user, V1::UserForm
    presenter V1::UserPresenter
    request do
      user = @form.save!
      present user
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
      present ::AuthenticationService.new.authenticate(params[:username],
        params[:password], params[:user_agent])
    end
  end
end
