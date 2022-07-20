# frozen_string_literal: true

# Create PlanFoodFactAssertions table
class CreatePlanFoodFactAssertions < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_food_fact_assertions do |t|
      t.references :plan, null: false, foreign_key: true, type: :uuid
      t.references :food_fact, null: false, foreign_key: true
      t.references :assertion, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
