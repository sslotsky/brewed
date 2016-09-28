require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  include_context 'json controller'

  let!(:user) { FactoryGirl.create(:user) }

  describe 'POST users/authenticate' do
    include_context 'api key validation disabled'

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
    it_behaves_like 'an authenticated controller action', :get, :index

    context 'when provided with an api key and an auth token' do
      include_context 'api key validation disabled'
      include_context 'authentication disabled'

      before do
        get :index
      end

      it 'should respond with a 200' do
        should respond_with(200)
      end

      it 'should respond with at least one user' do
        expect(json[:total_count]).to(eq(1))
      end

      it 'should have total_count number of users in the results array' do
        expect(json[:results].count).to(equal(json[:total_count]))
      end

      it 'should return a user' do
        expect(json[:results][0]).to(eq(present(user, with: V1::UserPresenter, type: :index)))
      end
    end
  end

  describe 'GET /users/:id' do
    it_behaves_like 'an authenticated controller action', :get, :show, params: { id: 0 }  

    context 'when provided with an api key and an auth token' do
      include_context 'api key validation disabled'
      include_context 'authentication disabled'

      before do
        get :show, params: { id: user.id }
      end

      it 'should respond with a 200' do
        should respond_with(200)
      end
    end
  end
end
