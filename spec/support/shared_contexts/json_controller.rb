RSpec.shared_context 'json controller' do
  before do
    @request.headers['Content-Type'] = 'application/json'
  end
end