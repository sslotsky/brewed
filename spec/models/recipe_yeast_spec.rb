require 'rails_helper'

RSpec.describe RecipeYeast, type: :model do
  let(:recipe_yeast) { build(:recipe_yeast) }

  it 'has a valid factory' do
    expect(recipe_yeast).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:yeast) }
  end

  describe 'validations' do
    it { should validate_presence_of(:recipe) }
    it { should validate_presence_of(:yeast) }
  end
end
