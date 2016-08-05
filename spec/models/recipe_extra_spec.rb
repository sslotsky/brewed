require 'rails_helper'

RSpec.describe RecipeExtra, type: :model do
  let(:recipe_extra) { build(:recipe_extra) }

  it 'has a valid factory' do
    expect(recipe_extra).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:extra) }
  end

  describe 'validations' do
    it { should validate_presence_of(:recipe) }
    it { should validate_presence_of(:extra) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_inclusion_of(:amount_unit).in_array(RECIPE_EXTRA_AMOUNT_UNITS) }
    it { should validate_numericality_of(:time).is_greater_than(0) }
    it { should validate_inclusion_of(:time_unit).in_array(RECIPE_EXTRA_TIME_UNITS) }
  end
end
