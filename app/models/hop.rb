class Hop < ApplicationRecord
  has_many :recipe_hops
  has_many :recipes, through: :recipe_hops

  validates :name, presence: true
  validates :alpha, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
