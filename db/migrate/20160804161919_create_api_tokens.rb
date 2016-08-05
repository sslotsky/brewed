class CreateApiTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :api_tokens do |t|
      t.integer :user_id, null: false
      t.string :auth_token, null: false
      t.string :refresh_token, null: false
      t.string :user_agent, null: false
      t.datetime :expires_at, null: false
      t.timestamps
    end
  end
end
