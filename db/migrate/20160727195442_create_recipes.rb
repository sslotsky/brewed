class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.references :parent
      t.references :user, null: false
      t.references :equipment_profile, null: false
      t.string :name, null: false
      t.float :og, null: false
      t.float :fg, null: false
      t.float :ibu, null: false
      t.float :color, null: false
      t.float :abv, null: false
      t.float :balance, null: false
      t.float :batch_size, null: false
      t.integer :boil_time, null: false
      t.float :fermentation_temp, null: false
      t.text :notes
      t.timestamps null: false
    end
  end
end
