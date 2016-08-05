class CreateRecipeExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_extras do |t|
      t.references :recipe, null: false
      t.references :extra, null: false
      t.float :amount, null: false
      t.string :amount_unit, null: false
      t.float :time, null: false
      t.string :time_unit, null: false
      t.string :use, null: false, blank: false
      t.string :notes
      t.timestamps null: false
    end
  end
end
