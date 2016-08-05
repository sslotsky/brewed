require 'rails_helper'

RSpec.describe Hop, type: :model do
  let(:hop) { build(:hop) }

  it 'has a valid factory' do
    expect(hop).to be_valid
  end

  describe 'associations' do
    it { should have_many(:recipe_hops) }
    it { should have_many(:recipes).through(:recipe_hops) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:alpha).is_greater_than_or_equal_to(0) }
  end
end
