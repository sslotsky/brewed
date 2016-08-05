class CreateRecipeFermentables < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_fermentables do |t|
      t.references :recipe, null: false
      t.references :fermentable, null: false
      t.float :amount, null: false
      t.string :use, null: false, blank: false
      t.string :notes
      t.timestamps null: false
    end
  end
end
