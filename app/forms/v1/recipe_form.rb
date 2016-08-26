class V1::RecipeForm < Form
  def initialize(params)
    @recipe = params.has_key?(:id) && Recipe.find_by(id: params[:id]) || Recipe.new
    super(params)
  end

  attribute :parent_id, Integer
  attribute :name, String
  attribute :recipe_fermentables, Array[RecipeFermentableForm]
  attribute :recipe_hops, Array[RecipeHopForm]
  attribute :recipe_yeasts, Array[RecipeYeastForm]
  attribute :recipe_extras, Array[RecipeExtraForm]
  attribute :og, Float
  attribute :fg, Float
  attribute :color, Integer
  attribute :ibu, Integer
  attribute :abv, Float
  attribute :balance, Float
  attribute :batch_size, Float
  attribute :boil_time, Integer
  attribute :fermentation_temp, Float
  attribute :equipment_profile, EquipmentProfileForm
  attribute :user_id, Integer

  def with_user(user)
    self.user_id = user.id
    self
  end
  
  def errors
    @recipe.errors
  end

  def valid?
    build
    @recipe.valid?
  end

  def build
    @recipe.parent_id = self.parent_id
    @recipe.name = self.name
    @recipe.equipment_profile = self.equipment_profile.build
    @recipe.og = self.og
    @recipe.fg = self.fg
    @recipe.color = self.color
    @recipe.ibu = self.ibu
    @recipe.abv = self.abv
    @recipe.balance = self.balance
    @recipe.batch_size = self.batch_size
    @recipe.boil_time = self.boil_time
    @recipe.fermentation_temp = self.fermentation_temp
    @recipe.user_id = self.user_id
    @recipe.recipe_fermentables = self.recipe_fermentables.map { |rf| rf.build }
    @recipe.recipe_hops = self.recipe_hops.map { |rh| rh.build }
    @recipe.recipe_yeasts = self.recipe_yeasts.map { |ry| ry.build }
    @recipe.recipe_extras = self.recipe_extras.map { |re| re.build }
  end

  def save!
    build
    @recipe.save!
    @recipe
  end
end