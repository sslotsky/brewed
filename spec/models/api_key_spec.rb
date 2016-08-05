require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  let(:api_key) { build(:api_key) }

  it 'has a valid factory' do
    expect(api_key).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:app_name) }

    # api_key is set in a before_validation callback, so even if set to nil
    # this validation will never fail.
    # it { should validate_presence_of(:api_key) }

    it { expect(api_key).to validate_uniqueness_of(:app_name) }
    it { expect(api_key).to validate_uniqueness_of(:api_key) }
  end

  describe 'callbacks' do
    it { should callback(:generate_api_key).before(:validation) }
    it { should callback(:generate_api_key).before(:create) }
  end

  describe 'methods' do
    it 'should successfully generate API key'
  end
end
