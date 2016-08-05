class V1::RecipeHopForm < Form
  attribute :hop_id, Integer
  attribute :amount, Float
  attribute :time, Integer
  attribute :use, String
  attribute :form, String

  def build
    RecipeHop.new(
      hop_id: self.hop_id,
      amount: self.amount,
      time: self.time,
      use: self.use,
      form: self.form
    )
  end
end