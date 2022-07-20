# frozen_string_literal: true

# Create assertions table
class CreateAssertions < ActiveRecord::Migration[7.0]
  def change
    create_table :assertions do |t|
      t.string :name, null: false
      t.string :action, null: false, unique: true

      t.timestamps
    end
  end
end
