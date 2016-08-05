class CreateYeasts < ActiveRecord::Migration[5.0]
  def change
    create_table :yeasts do |t|
      t.string :name, null: false
      t.float :attenuation, null: false
      t.timestamps null: false
    end
  end
end
