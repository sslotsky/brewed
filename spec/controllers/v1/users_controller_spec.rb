require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:api_key) { FactoryGirl.create(:api_key) }
  let!(:api_token) { FactoryGirl.create(:api_token) }

  before do
    @request.headers['X-Api-Key'] = api_key.api_key
    @request.headers['X-Auth-Token'] = api_token.auth_token
    @request.headers['Content-Type'] = 'application/json'
  end

  it_behaves_like 'an authenticated controller action', :get, :index  
  it_behaves_like 'an authenticated controller action', :get, :show, params: { id: 0 }  

  describe 'POST users/authenticate' do
    before do
      post :authenticate, params: { username: user.username, password: 'please', user_agent: 'test' }
    end

    it 'should respond with a 200' do
      should respond_with(200)
    end

    it 'should set a cookie' do
      expect(response.cookies['auth_token']).not_to(be_nil)
    end
  end

  describe 'GET /users' do
    before do
      get :index
    end

    it 'should respond with a 200' do
      should respond_with(200)
    end

    it 'should respond with at least one user' do
      expect(json[:total_count]).to(be > 0)
    end

    it 'should have total_count number of users in the results array' do
      expect(json[:results].count).to(equal(json[:total_count]))
    end

    it 'should return a user' do
      expect(json[:results][0])
        .to(eq(present(user, with: V1::UserPresenter, type: :index)))
    end
  end

  describe 'GET /users/:id' do
    before do
      get :show, params: { id: user.id }
    end

    it 'should respond with a 200' do
      should respond_with(200)
    end
  end
end
