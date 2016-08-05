class V1::RecipeExtraForm < Form
  attribute :extra_id, Integer
  attribute :amount, Float
  attribute :amount_unit, String
  attribute :time, Float
  attribute :time_unit, String
  attribute :use, String

  def build
    RecipeExtra.new(
      extra_id: self.extra_id,
      amount: self.amount,
      amount_unit: self.amount_unit,
      time: self.time,
      time_unit: self.time_unit,
      use: self.use
    )
  end
end