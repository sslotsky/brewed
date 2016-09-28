RSpec.shared_examples 'an authenticated controller action' do |verb, action, params|
  let(:api_key) { FactoryGirl.create(:api_key) }
  let(:api_token) { FactoryGirl.create(:api_token) }

  before do
    @request.headers['Content-Type'] = 'application/json'
  end

  context 'when not provided with an auth token' do
    before do
      @request.headers['X-Api-Key'] = api_key.api_key
      @request.headers['X-Auth-Token'] = nil
    end

    it 'should return a 403' do
      self.send(verb, action, params)
      should respond_with(403)
    end
  end

  context 'when not provided with an api key' do
    before do
      @request.headers['X-Api-Key'] = nil
      @request.headers['X-Auth-Token'] = api_token.auth_token 
    end

    it 'should return a 401' do
      self.send(verb, action, params)
      should respond_with(401)
    end
  end
end
