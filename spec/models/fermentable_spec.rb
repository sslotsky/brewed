require 'rails_helper'

RSpec.describe Fermentable, type: :model do
  let(:fermentable) { build(:fermentable) }

  it 'has a valid factory' do
    expect(fermentable).to be_valid
  end

  describe 'associations' do
    it { should have_many(:recipe_fermentables) }
    it { should have_many(:recipes).through(:recipe_fermentables) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:ppg).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:color).is_greater_than_or_equal_to(0).only_integer }
  end
end
