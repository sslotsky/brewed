require 'rails_helper'

RSpec.describe RecipeFermentable, type: :model do
  let(:recipe_fermentable) { build(:recipe_fermentable) }

  it 'has a valid factory' do
    expect(recipe_fermentable).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:fermentable) }
  end

  describe 'validations' do
    it { should validate_presence_of(:recipe) }
    it { should validate_presence_of(:fermentable) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_inclusion_of(:use).in_array(FERMENTABLE_USES.keys) }
  end
end
