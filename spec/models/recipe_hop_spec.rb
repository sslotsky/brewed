require 'rails_helper'

RSpec.describe RecipeHop, type: :model do
  let(:recipe_hop) { build(:recipe_hop) }

  it 'has a valid factory' do
    expect(recipe_hop).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:hop) }
  end

  describe 'validations' do
    it { should validate_presence_of(:recipe) }
    it { should validate_presence_of(:hop) }

    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_numericality_of(:time).is_greater_than_or_equal_to(0) }
    it { should validate_inclusion_of(:use).in_array(HOP_USES.keys) }
    it { should validate_inclusion_of(:form).in_array(HOP_FORMS.keys) }
  end
end
