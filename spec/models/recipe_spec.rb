require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }

  it 'has a valid factory' do
    expect(recipe).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:user) }
    
    it { should belong_to(:equipment_profile).dependent(:destroy) }
    it { should accept_nested_attributes_for(:equipment_profile) }

    it { should belong_to(:parent) }

    it { should have_one(:child).dependent(:destroy) }

    it { should have_many(:recipe_fermentables).dependent(:destroy) }
    it { should have_many(:recipe_hops).dependent(:destroy) }
    it { should have_many(:recipe_yeasts).dependent(:destroy) }
    it { should have_many(:recipe_extras).dependent(:destroy) }

    it { should have_many(:fermentables).through(:recipe_fermentables) }
    it { should have_many(:hops).through(:recipe_hops) }
    it { should have_many(:yeasts).through(:recipe_yeasts) }
    it { should have_many(:extras).through(:recipe_extras) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:equipment_profile) }
    it { should validate_presence_of(:name) }

    it { should validate_numericality_of(:og).is_greater_than(SG_WATER) }
    it { expect(build(:recipe)).to validate_numericality_of(:fg).is_greater_than(SG_ETHANOL) }
    it { should validate_numericality_of(:ibu).is_greater_than(0) }
    it { should validate_numericality_of(:color).is_greater_than(0) }
    it { should validate_numericality_of(:abv).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
    it { should validate_numericality_of(:boil_time).is_greater_than(0).only_integer }
    it { should validate_numericality_of(:fermentation_temp).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(212) }

    it 'should only be valid if the fg is lower than than the og' do
      expect(build(:recipe, { fg: 1.050, og: 1.040 })).to be_invalid
    end
  end
end
