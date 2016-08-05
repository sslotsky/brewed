require 'rails_helper'

RSpec.describe Yeast, type: :model do
  let(:yeast) { build(:yeast) }

  it 'has a valid factory' do
    expect(yeast).to be_valid
  end

  describe 'associations' do
    it { should have_many(:recipe_yeasts) }
    it { should have_many(:recipes).through(:recipe_yeasts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:attenuation).is_greater_than(0) }
  end
end
