class V1::FermentablePresenter < Presenter
  attribute :id, Integer
  attribute :name, String
  attribute :ppg, Integer
  attribute :color, Integer
end

class V1::RecipeFermentablePresenter < Presenter
  attribute :id, Integer
  attribute :fermentable, V1::FermentablePresenter
  attribute :use, String
  attribute :amount, Float

  def initialize(recipe_fermentable)
    super(recipe_fermentable)
    self.fermentable = V1::FermentablePresenter.new(recipe_fermentable.fermentable)
  end
end

class V1::HopPresenter < Presenter
  attribute :id, Integer
  attribute :name, String
  attribute :alpha, Float
end

class V1::RecipeHopPresenter < Presenter
  attribute :id, Integer
  attribute :hop, V1::HopPresenter
  attribute :amount, Float
  attribute :time, Integer
  attribute :use, String
  attribute :form, String

  def initialize(recipe_hop)
    super(recipe_hop)
    self.hop = V1::HopPresenter.new(recipe_hop.hop)
  end
end

class V1::YeastPresenter < Presenter
  attribute :id, Integer
  attribute :name, String
  attribute :attenuation, Float
end

class V1::RecipeYeastPresenter < Presenter
  attribute :id, Integer
  attribute :yeast, V1::YeastPresenter

  def initialize(recipe_yeast)
    super(recipe_yeast)
    self.yeast = V1::YeastPresenter.new(recipe_yeast.yeast)
  end
end

class V1::ExtraPresenter < Presenter
  attribute :id, Integer
  attribute :name, String
end

class V1::RecipeExtraPresenter < Presenter
  attribute :id, Integer
  attribute :extra, V1::ExtraPresenter
  attribute :amount, Float
  attribute :amount_unit, String
  attribute :time, Float
  attribute :time_unit, String
  attribute :use, String

  def initialize(recipe_extra)
    super(recipe_extra)
    self.extra = V1::ExtraPresenter.new(recipe_extra.extra)
  end
end

class V1::EquipmentProfilePresenter < Presenter
  attribute :id, Integer
  attribute :name, String
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
end

class V1::RecipePresenter < Presenter
  attribute :id, Integer
  attribute :name, String
  attribute :og, Float
  attribute :fg, Float
  attribute :ibu, Integer
  attribute :color, Integer
  attribute :abv, Float
  attribute :balance, Float
  attribute :batch_size, Float
  attribute :fermentation_temp, Integer
  attribute :equipment_profile, V1::EquipmentProfilePresenter
  attribute :recipe_fermentables, Array[V1::RecipeFermentablePresenter]
  attribute :recipe_hops, Array[V1::RecipeHopPresenter]
  attribute :recipe_yeasts, Array[V1::RecipeYeastPresenter]
  attribute :recipe_extras, Array[V1::RecipeExtraPresenter]

  def initialize(recipe)
    super(recipe)
    
    self.equipment_profile = V1::EquipmentProfilePresenter.new(recipe.equipment_profile)

    recipe.recipe_fermentables.each do |rf|
      self.recipe_fermentables << V1::RecipeFermentablePresenter.new(rf)
    end
    
    recipe.recipe_hops.each do |rh|
      self.recipe_hops << V1::RecipeHopPresenter.new(rh)
    end
    
    recipe.recipe_yeasts.each do |ry|
      self.recipe_yeasts << V1::RecipeYeastPresenter.new(ry)
    end
    
    recipe.recipe_extras.each do |re|
      self.recipe_extras << V1::RecipeExtraPresenter.new(re)
    end
  end
end