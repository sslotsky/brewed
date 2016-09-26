require 'rails_helper'

RSpec.describe V1::RecipesController, type: :controller do
  include_context 'json controller'

  it_behaves_like 'an authenticated controller action', :get, :index
  it_behaves_like 'an authenticated controller action', :get, :show, params: { id: 0 }
  it_behaves_like 'an authenticated controller action', :post, :create

  describe 'GET /recipes' do
    include_context 'api key validation disabled'
    include_context 'authentication disabled'

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
    include_context 'api key validation disabled'
    include_context 'authentication disabled'

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
    include_context 'api key validation disabled'
    include_context 'authentication disabled'
  end
end
