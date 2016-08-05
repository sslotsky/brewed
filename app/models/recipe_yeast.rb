class RecipeYeast < ApplicationRecord
  belongs_to :recipe
  belongs_to :yeast

  validates :recipe, presence: true
  validates :yeast, presence: true
end
