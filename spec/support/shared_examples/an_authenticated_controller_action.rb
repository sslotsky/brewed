RSpec.shared_examples 'an authenticated controller action' do |verb, action, params|
  let(:api_key) { FactoryGirl.create(:api_key) }

  before do
    @request.headers['X-Api-Key'] = api_key.api_key
    @request.headers['X-Auth-Token'] = nil
    @request.headers['Content-Type'] = 'application/json'
  end

  context 'when not provided with an auth token' do
    it 'should return a 403' do
      self.send(verb, action, params)
      should respond_with(403)
    end
  end
end
