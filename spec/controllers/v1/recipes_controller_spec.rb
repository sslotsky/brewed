require 'rails_helper'

RSpec.describe V1::RecipesController, type: :controller do
  let!(:api_key) { FactoryGirl.create(:api_key) }
  let!(:api_token) { FactoryGirl.create(:api_token) }

  before do
    @request.headers['X-Api-Key'] = api_key.api_key
    @request.headers['X-Auth-Token'] = api_token.auth_token
    @request.headers['Content-Type'] = 'application/json'
  end

  it_behaves_like 'an authenticated controller action', :get, :index
  it_behaves_like 'an authenticated controller action', :get, :show, params: { id: 0 }
  it_behaves_like 'an authenticated controller action', :post, :create

  describe 'GET /recipes' do
    let!(:recipe) { FactoryGirl.create(:recipe) }

    before do
      get :index
    end

    it 'should respond with a 200' do
      should respond_with(200)
    end

    it 'should respond with at least one recipe' do
      expect(json[:total_count]).to(be > 0)
    end

    it 'should have total_count number of recipes in the results array' do
      expect(json[:results].count).to(equal(json[:total_count]))
    end

    it 'should return a recipe' do
      expect(json[:results][0])
        .to(eq(present(recipe, with: V1::RecipePresenter, type: :index)))
    end
  end

  describe 'GET /recpipes/:id' do
    let!(:recipe) { FactoryGirl.create(:recipe) }

    before do
      get :show, params: { id: recipe.id }
    end

    it 'should respond with a 200 when passed an id' do
      should respond_with(200)
    end

    it 'should return a recipe' do
      expect(json)
        .to(eq(present(recipe, with: V1::RecipePresenter, type: :detail)))
    end
  end

  describe 'POST /recipes' do
  end
end
