class EquipmentProfile < ApplicationRecord
  has_one :recipe, dependent: :destroy
  
  validates :batch_size, numericality: { greater_than: 0 }
  validates :kettle_volume, numericality: { greater_than: 0 }
  validates :mash_tun_volume, numericality: { greater_than: 0 }
  validates :evap_rate, numericality: { greater_than: 0 }
  validates :trub_chiller_loss, numericality: { greater_than_or_equal_to: 0 }
  validates :mash_thickness, numericality: { greater_than: 0 }
  validates :lauter_deadspace, numericality: { greater_than_or_equal_to: 0 }
  validates :grain_absorption_factor, numericality: { greater_than: 0 }
  validates :boiling_temp, numericality: { greater_than: 0 }
  validates :mash_efficiency, numericality: { greater_than: 0 }
end
