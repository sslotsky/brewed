require 'rails_helper'

RSpec.describe EquipmentProfile, type: :model do
  let(:equipment_profile) { build(:equipment_profile) }

  it 'has a valid factory' do
    expect(equipment_profile).to be_valid
  end

  describe 'associations' do
    it { should have_one(:recipe).dependent(:destroy) }
  end

  describe 'validations' do
    it { expect(equipment_profile).to allow_value('', nil).for(:name) }
    it { expect(equipment_profile).to validate_numericality_of(:batch_size).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:kettle_volume).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:mash_tun_volume).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:evap_rate).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:trub_chiller_loss).is_greater_than_or_equal_to(0) }
    it { expect(equipment_profile).to validate_numericality_of(:mash_thickness).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:lauter_deadspace).is_greater_than_or_equal_to(0) }
    it { expect(equipment_profile).to validate_numericality_of(:grain_absorption_factor).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:boiling_temp).is_greater_than(0) }
    it { expect(equipment_profile).to validate_numericality_of(:mash_efficiency).is_greater_than(0) }
  end
end
