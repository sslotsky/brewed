class Recipe < ApplicationRecord
  belongs_to :parent, class_name: 'Recipe', required: false, inverse_of: :child
  has_one :child, class_name: 'Recipe', foreign_key: :parent_id, dependent: :destroy

  belongs_to :user

  belongs_to :equipment_profile, dependent: :destroy
  accepts_nested_attributes_for :equipment_profile

  has_many :recipe_fermentables, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :recipe_fermentables

  has_many :recipe_hops, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :recipe_hops

  has_many :recipe_yeasts, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :recipe_yeasts

  has_many :recipe_extras, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :recipe_extras

  has_many :fermentables, through: :recipe_fermentables
  has_many :hops, through: :recipe_hops
  has_many :yeasts, through: :recipe_yeasts
  has_many :extras, through: :recipe_extras

  validates :user, presence: true
  validates :equipment_profile, presence: true

  validates :name, presence: true

  validates :og, numericality: { greater_than: SG_WATER }
  validates :fg, numericality: { greater_than: SG_ETHANOL, less_than: Proc.new { |r| r.og } }
  validates :ibu, numericality: { greater_than: 0 }
  validates :color, numericality: { greater_than: 0 }
  validates :abv, :balance, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  validates :batch_size, numericality: { greater_than: 0, less_than_or_equal_to: Proc.new { |r| r.equipment_profile.batch_size } }
  validates :boil_time, numericality: { only_integer: true, greater_than: 0 }

  validates :fermentation_temp, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 212 }

  def as_json(options = nil)
    super({include: [:equipment_profile, {recipe_fermentables: {include: :fermentable}}, {recipe_hops: {include: :hop}}, {recipe_yeasts: {include: :yeast}}, {recipe_extras: {include: :extra}}]}.merge(options || {}))
  end
end
