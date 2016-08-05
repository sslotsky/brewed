FactoryGirl.define do
  factory :recipe do
    after(:create) do |recipe|
      create(:recipe_fermentable, recipe: recipe)
      create(:recipe_hop, recipe: recipe)
      create(:recipe_yeast, recipe: recipe)
    end
    user
    equipment_profile
    name 'Rhinebier'
    og 1.050
    fg 1.008
    ibu 30
    color 8
    abv 0.05
    balance 0.5
    boil_time 60
    batch_size 5
    fermentation_temp 68
  end
end
