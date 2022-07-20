# frozen_string_literal: true

# Create food_assertions table
class CreateFoodAssertions < ActiveRecord::Migration[7.0]
  def change
    create_table :food_assertions do |t|
      t.references :food, null: false, foreign_key: true, type: :uuid
      t.references :assertion, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
    add_index :food_assertions, %w[food_id assertion_id], unique: true
  end
end
