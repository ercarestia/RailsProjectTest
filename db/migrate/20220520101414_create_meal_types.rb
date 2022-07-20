# frozen_string_literal: true

# Create table for meal_types table
class CreateMealTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_types do |t|
      t.string :name
      t.integer :occasions, array: true, default: []

      t.timestamps
    end
  end
end
