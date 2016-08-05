require 'rails_helper'

RSpec.describe Extra, type: :model do
  let(:extra) { build(:extra) }

  it 'has a valid factory' do
    expect(extra).to be_valid
  end

  describe 'associations' do
    it { should have_many(:recipe_extras) }
    it { should have_many(:recipes).through(:recipe_extras) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
