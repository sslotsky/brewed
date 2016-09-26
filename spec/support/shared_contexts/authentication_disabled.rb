RSpec.shared_context 'authentication disabled' do
  before do
    expect(subject).to(receive(:'authenticate!') { true })
  end
end