# frozen_string_literal: true

# Create table for weeks table
class CreateWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :weeks do |t|
      t.string :name, null: false
      t.integer :order_key, null: false, default: 0, index: true

      t.timestamps
    end
  end
end
