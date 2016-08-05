class Yeast < ApplicationRecord
  has_many :recipe_yeasts
  has_many :recipes, through: :recipe_yeasts

  validates :name, presence: true
  validates :attenuation, numericality: { greater_than: 0, less_than_or_equal_to: 1 }
end
