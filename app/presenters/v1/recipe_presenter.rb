module V1
  class RecipePresenter < Presenter
    def initialize(recipe)
      @recipe = recipe
    end
    
    def to_jbuilder(type)
      Jbuilder.new do |json|
        json.extract! @recipe,
          :id, :parent_id, :name, :batch_size, :boil_time, :og, :fg, :abv,
          :color, :ibu, :balance, :notes, :fermentation_temp, :created_at,
          :updated_at
        
        json.user do
          json.extract! @recipe.user, :id, :username
        end
          
        if type == :detail   
          json.equipment_profile do
            json.extract! @recipe.equipment_profile,
              :name, :batch_size, :kettle_volume, :mash_tun_volume, :evap_rate,
              :trub_chiller_loss, :mash_thickness, :lauter_deadspace,
              :grain_absorption_factor, :boiling_temp, :mash_efficiency
          end

          json.recipe_fermentables @recipe.recipe_fermentables do |rf|
            json.extract! rf, :id, :amount, :use
            json.fermentable do
              json.extract! rf.fermentable, :id, :name, :ppg, :color
            end
          end

          json.recipe_hops @recipe.recipe_hops do |rh|
            json.extract! rh, :id, :amount, :time, :use, :form

            json.hop do
              json.extract! rh.hop, :id, :name
            end
          end

          json.recipe_yeasts @recipe.recipe_yeasts do |ry|
            json.extract! ry, :id

            json.yeast do
              json.extract! ry.yeast, :id, :name
            end
          end

          json.recipe_extras @recipe.recipe_extras do |re|
            json.extract! re, :id, :time, :time_unit, :amount, :amount_unit

            json.extra do
              json.extract! re.extra, :id, :name
            end
          end
        end
      end
    end

    def as_json(**args)
      to_jbuilder(args[:type]).attributes!
    end
  end
end
