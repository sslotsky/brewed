class RecipeFermentable < ApplicationRecord
  belongs_to :recipe
  belongs_to :fermentable

  validates :recipe, presence: true
  validates :fermentable, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates_inclusion_of :use, in: FERMENTABLE_USES.keys.map(&:to_s)
end
