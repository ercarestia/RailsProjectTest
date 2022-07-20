# frozen_string_literal: true

# Create table for days table
class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.string :name, null: false
      t.integer :order_key, null: false, default: 0, index: true

      t.timestamps
    end
  end
end
