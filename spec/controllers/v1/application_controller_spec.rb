require 'rails_helper'

RSpec.describe V1::ApplicationController, type: :controller do
  include_context 'json controller'

  controller do
    def index
      authenticate!
      head 200
    end
  end

  let!(:api_key) { FactoryGirl.create(:api_key) }
  let!(:api_token) { FactoryGirl.create(:api_token) }

  context 'when provided with both an api key an an auth token provided in headers' do
    before do
      @request.headers['X-Api-Key'] = api_key.api_key
      @request.headers['X-Auth-Token'] = api_token.auth_token
    end

    it 'should return a 200' do
      get :index
      should respond_with(200)
    end
  end

  context 'when provided with an api key provided in headers an an auth token provided as a cookie' do
    before do
      @request.headers['X-Api-Key'] = api_key.api_key
      @request.cookies[:auth_token] = api_token.auth_token
    end

    it 'should return a 200' do
      get :index
      should respond_with(200)
    end
  end

  context 'when an api key is missing' do
    it 'should return a 401' do
      get :index
      should respond_with(401)
    end
  end

  context 'when an auth token is missing' do
    include_context 'api key validation disabled'

    it 'should return a 403' do
      get :index
      should respond_with(403)
    end
  end
end
