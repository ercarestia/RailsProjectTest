# frozen_string_literal: true

# Create table for plan_weeks table
class CreatePlanWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_weeks, id: :uuid do |t|
      t.references :plan, null: false, foreign_key: true, type: :uuid
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plan_weeks, %w[plan_id week_id], unique: true
  end
end
