class CreateRecipeHops < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_hops do |t|
      t.references :recipe, null: false
      t.references :hop, null: false
      t.float :amount, null: false
      t.float :time, null: false
      t.string :use, null: false, blank: false
      t.string :form, null: false, blank: false
      t.string :notes
      t.timestamps null: false
    end
  end
end
