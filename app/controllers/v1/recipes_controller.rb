class V1::RecipesController < ApplicationController
  get :index do
    params do
      param :page, Integer, min: 1
      param :results_per_page, Integer, min: 1, max: 100
      param :sort, String, values: %i(id name created_at)
      param :sort_reverse, Boolean
    end
    presenter V1::SearchResultsPresenter
    request do
      present Recipe.search(**declared), with: V1::RecipePresenter
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
      present @form.with_user(current_user).save!, type: :detail
    end
  end
end
