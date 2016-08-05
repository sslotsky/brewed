class V1::RecipeYeastForm < Form
  attribute :yeast_id, Integer

  def build
    RecipeYeast.new(
      yeast_id: self.yeast_id
    )
  end
end