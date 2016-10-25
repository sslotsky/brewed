class V1::SessionsController < ApplicationController
  get :info do
    presenter V1::UserPresenter
    request do
      present current_user, type: :detail
    end
  end
end

