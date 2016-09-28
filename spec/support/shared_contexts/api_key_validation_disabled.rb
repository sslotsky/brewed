RSpec.shared_context 'api key validation disabled' do
  before do
    expect(subject).to(receive(:'validate_api_key!') { true })
  end
end