class RecipeExtra < ApplicationRecord
  belongs_to :recipe
  belongs_to :extra

  validates :recipe, presence: true
  validates :extra, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates_inclusion_of :amount_unit, in: RECIPE_EXTRA_AMOUNT_UNITS
  validates :time, numericality: { greater_than: 0 }
  validates_inclusion_of :time_unit, in: RECIPE_EXTRA_TIME_UNITS
  validates_inclusion_of :use, in: EXTRA_USES.keys.map(&:to_s)
end
