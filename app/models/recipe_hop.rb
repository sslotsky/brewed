class RecipeHop < ApplicationRecord
  belongs_to :recipe
  belongs_to :hop

  validates :recipe, presence: true
  validates :hop, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :time, numericality: { greater_than_or_equal_to: 0 }
  validates_inclusion_of :use, in: HOP_USES.keys.map(&:to_s)
  validates_inclusion_of :form, in: HOP_FORMS.keys.map(&:to_s)
end
