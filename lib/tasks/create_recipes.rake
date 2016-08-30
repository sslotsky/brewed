require 'marky_markov'

namespace :brewed do
  def rand_range(min, max)
    rand * (max - min) + min
  end

  def generate_recipe_name
    filename = File.join(Rails.root, 'lib', 'recipe_names.txt')
    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_file(filename)
    markov.generate_n_words(rand(4) + 1)
  end

  def create_recipe
    r = Recipe.new(
      name: generate_recipe_name,
      user_id: 1,
      og: rand_range(1.030, 1.075),
      fg: rand_range(1.008, 1.029),
      ibu: rand_range(10, 60),
      color: rand_range(1, 40),
      abv: rand,
      balance: rand,
      batch_size: rand_range(1, 10),
      boil_time: 60,
      fermentation_temp: rand_range(50, 70)
    )

    r.equipment_profile = EquipmentProfile.new(
      batch_size: 5.5,
      kettle_volume: 8,
      mash_tun_volume: 10,
      evap_rate: 1,
      trub_chiller_loss: 0.5,
      mash_thickness: 0.2,
      lauter_deadspace: 0.5,
      grain_absorption_factor: 0.25,
      boiling_temp: 212,
      mash_efficiency: 0.6
    )

    r.recipe_fermentables << RecipeFermentable.new(
      fermentable_id: Fermentable.first.id,
      amount: 5,
      use: "mash"
    )

    r.recipe_hops << RecipeHop.new(
      hop_id: Hop.first.id,
      amount: 1,
      time: 60,
      use: "boil",
      form: "pellet"
    )

    r.recipe_yeasts << RecipeYeast.new(
      yeast_id: Yeast.first.id
    )

    r.recipe_extras << RecipeExtra.new(
      extra_id: Extra.first.id,
      amount: 1,
      amount_unit: "ea",
      time: 60,
      time_unit: "min",
      use: "boil"
    )

    if r.valid?
      r.save
      puts r.name
    else
      puts r.errors.inspect
    end 
  end

  task :create_recipes, [:num] => :environment do |t, args|
    (0..args[:num].to_i).each { create_recipe }
  end
end
