require 'rails_helper'

RSpec.describe ApiToken, type: :model do
  let(:api_token) { build(:api_token) }

  it 'has a valid factory' do
    expect(api_token).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }

    # auth_token and refresh_token are set in a before_validation callback, so
    # even if set to nil this validation will never fail.
    #it { expect(api_token).to validate_presence_of(:auth_token) }
    #it { expect(api_token).to validate_presence_of(:refresh_token) }
    
    it { expect(api_token).to validate_uniqueness_of(:auth_token) }
    it { expect(api_token).to validate_uniqueness_of(:refresh_token) }
  end

  describe 'callbacks' do
    it { should callback(:generate_auth_token).before(:validation) }
    it { should callback(:generate_refresh_token).before(:validation) }
    it { should callback(:set_expiration_date).before(:validation) }
  end

  describe 'methods' do
    it 'should successfully generate auth token'
    it 'should successfully generate refresh token'
    it 'should successfully set auth token expiration date'
  end
end
