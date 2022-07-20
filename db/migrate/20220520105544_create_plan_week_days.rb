# frozen_string_literal: true

# Create table for plan_week_days table
class CreatePlanWeekDays < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_week_days, id: :uuid do |t|
      t.references :plan_week, null: false, foreign_key: true, type: :uuid
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end

    add_index :plan_week_days, %w[plan_week_id day_id], unique: true
  end
end
