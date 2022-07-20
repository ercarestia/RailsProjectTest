# frozen_string_literal: true

# Create table for plans table
class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans, id: :uuid do |t|
      t.string :name, null: false
      t.integer :order_key, null: false, default: 0, index: true
      t.integer :legacy_key
      t.integer :days, array: true, default: []
      t.integer :occasions, array: true, default: []
      t.jsonb :aggregate, default: {}

      t.timestamps
    end
  end
end
