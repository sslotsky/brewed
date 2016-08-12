class V1::RecipesController < ApplicationController
  include Swagger::Blocks

  swagger_path '/recipes/{id}' do
    operation :get do
      key :description, 'Returns a single recipe'
      key :operationId, 'findRecipeById'
      key :tags, [
        'recipe'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of the recipe to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'recipe response'
        schema do
          key :'$ref', :RecipePresenter
        end
      end
      # response :default do
      #   key :description, 'unexpected error'
      #   schema do
      #     key :'$ref', :ErrorModel
      #   end
      # end
    end
  end

  get :index do
    params do
      param :limit, Integer, min: 1, max: 100, default: 10
      param :offset, Integer, min: 0, default: 0
    end
    presenter V1::RecipePresenter
    request do
      present Recipe.limit(params[:limit]).offset(params[:offset])
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
