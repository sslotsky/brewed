class CreateRecipeYeasts < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_yeasts do |t|
      t.references :recipe, null: false
      t.references :yeast, null: false
      t.string :notes
      t.timestamps null: false
    end
  end
end
