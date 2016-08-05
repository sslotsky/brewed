class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :app_name, null: false
      t.string :api_key, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
