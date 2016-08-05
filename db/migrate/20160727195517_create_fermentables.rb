class CreateFermentables < ActiveRecord::Migration[5.0]
  def change
    create_table :fermentables do |t|
      t.string :name, null: false
      t.integer :ppg, null: false
      t.integer :color, null: false
      t.timestamps null: false
    end
  end
end
