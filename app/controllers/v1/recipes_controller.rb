class V1::RecipesController < ApplicationController
  before_action :authenticate!
  
  get :index do
    params do
      param :page, Integer, min: 1
      param :results_per_page, Integer, min: 1, max: 100
      param :sort, String, values: %i(id name og fg ibu color abv balance batch_size boil_time fermentation_temp created_at updated_at)
      param :sort_reverse, ::Boolean
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
      present Recipe.find(params[:id]), type: :detail
    end
  end

  post :create do
    form :recipe, V1::RecipeForm
    presenter V1::RecipePresenter
    request do
      present @form.with_user(current_user).save!, type: :detail
    end
  end
end
