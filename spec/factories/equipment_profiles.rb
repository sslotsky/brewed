FactoryGirl.define do
  factory :equipment_profile do
    batch_size 5
    kettle_volume 8
    mash_tun_volume 10
    evap_rate 1
    trub_chiller_loss 0
    mash_thickness 1.25
    lauter_deadspace 0
    grain_absorption_factor 0.1
    boiling_temp 212
    mash_efficiency 0.75
  end
end
