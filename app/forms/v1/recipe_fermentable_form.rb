class V1::RecipeFermentableForm < Form
  attribute :fermentable_id, Integer
  attribute :amount, Float
  attribute :use, String

  def build
    RecipeFermentable.new(
      fermentable_id: self.fermentable_id,
      amount: self.amount,
      use: self.use
    )
  end
end