class Fermentable < ApplicationRecord
  has_many :recipe_fermentables
  has_many :recipes, through: :recipe_fermentables

  validates :name, presence: true
  validates :ppg, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :color, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
