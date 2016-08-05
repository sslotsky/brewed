class Extra < ApplicationRecord
  has_many :recipe_extras
  has_many :recipes, through: :recipe_extras

  validates :name, presence: true
end
