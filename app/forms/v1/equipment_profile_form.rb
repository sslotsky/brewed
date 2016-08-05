class V1::EquipmentProfileForm < Form
  def initialize(params)
    @equipment_profile = params.has_key?(:id) && EquipmentProfile.find_by(id: params[:id]) || EquipmentProfile.new
    super(params)
  end

  attribute :batch_size, Float
  attribute :kettle_volume, Float
  attribute :mash_tun_volume, Float
  attribute :evap_rate, Float
  attribute :trub_chiller_loss, Float
  attribute :mash_thickness, Float
  attribute :lauter_deadspace, Float
  attribute :grain_absorption_factor, Float
  attribute :boiling_temp, Float
  attribute :mash_efficiency, Float

  def build
    @equipment_profile.batch_size = self.batch_size
    @equipment_profile.kettle_volume = self.kettle_volume
    @equipment_profile.mash_tun_volume = self.mash_tun_volume
    @equipment_profile.evap_rate = self.evap_rate
    @equipment_profile.trub_chiller_loss = self.trub_chiller_loss
    @equipment_profile.mash_thickness = self.mash_thickness
    @equipment_profile.lauter_deadspace = self.lauter_deadspace
    @equipment_profile.grain_absorption_factor = self.grain_absorption_factor
    @equipment_profile.boiling_temp = self.boiling_temp
    @equipment_profile.mash_efficiency = self.mash_efficiency
    @equipment_profile
  end
end