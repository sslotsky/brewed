class V1::RecipesController < ApplicationController
  get :index do
    presenter V1::RecipePresenter
    request do
      recipes = Recipe.all.limit(10)
      present recipes
    end
  end

  get :show do
    params do
      param :id, Integer
    end
    presenter V1::RecipePresenter
    request do
      recipe = Recipe.find(params[:id])
      present recipe
    end
  end

  post :create do
    form :recipe, V1::RecipeForm
    presenter V1::RecipePresenter
    request do
      authenticate!
      recipe = @form.with_user(current_user).save!
      present recipe
    end
  end
end
