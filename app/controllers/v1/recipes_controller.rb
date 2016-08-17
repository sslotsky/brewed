class V1::RecipesController < ApplicationController
  get :index do
    params do
      param :limit, Integer, min: 1, max: 100, default: 10
      param :offset, Integer, min: 0, default: 0
    end
    presenter V1::SearchResultsPresenter[V1::RecipePresenter]
    request do
      present Recipe.search(**declared)
    end
  end

  get :show do
    params do
      param :id, Integer
    end
    presenter V1::RecipePresenter
    request do
      present Recipe.find(params[:id])
    end
  end

  post :create do
    form :recipe, V1::RecipeForm
    presenter V1::RecipePresenter
    request do
      authenticate!
      present @form.with_user(current_user).save!
    end
  end
end
