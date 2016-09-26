require 'rails_helper'

RSpec.describe V1::ApplicationController, type: :controller do
  controller do
    def index
      authenticate!
      head 200
    end
  end

  let!(:api_key) { FactoryGirl.create(:api_key) }
  let!(:api_token) { FactoryGirl.create(:api_token) }

  before do
    @request.headers['X-Api-Key'] = api_key.api_key
    @request.headers['X-Auth-Token'] = api_token.auth_token
    @request.headers['Content-Type'] = 'application/json'
  end

  context 'when provided with both an api key an an auth token' do
    it 'should return a 200' do
      get :index
      should respond_with(200)
    end
  end

  context 'when an api key is missing' do
    before do
      @request.headers['X-Api-Key'] = nil
    end

    it 'should return a 401' do
      get :index
      should respond_with(401)
    end
  end

  context 'when an auth token is missing' do
    before do
      @request.headers['X-Auth-Token'] = nil
    end

    it 'should return a 403' do
      get :index
      should respond_with(403)
    end
  end
end
