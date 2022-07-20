# frozen_string_literal: true

# Create FoodFacts table
class CreateFoodFacts < ActiveRecord::Migration[7.0]
  def change
    create_table :food_facts do |t|
      t.string :name, null: false
      t.string :fact, null: false
      t.string :data_type, null: false
      t.string :allowed_values, array: true

      t.timestamps
    end
  end
end
