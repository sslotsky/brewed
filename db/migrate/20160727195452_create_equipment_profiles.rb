class CreateEquipmentProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_profiles do |t|
      t.string :name
      t.float :batch_size, null: false
      t.float :kettle_volume, null: false
      t.float :mash_tun_volume, null: false
      t.float :evap_rate, null: false
      t.float :trub_chiller_loss, null: false
      t.float :mash_thickness, null: false
      t.float :lauter_deadspace, null: false
      t.float :grain_absorption_factor, null: false
      t.float :boiling_temp, null: false
      t.float :mash_efficiency, null: false
      t.timestamps null: false
    end
  end
end
