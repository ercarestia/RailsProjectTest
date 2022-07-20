# frozen_string_literal: true

# Create table for plan_week_day_occasion_foods table
class CreatePlanWeekDayOccasionFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_week_day_occasion_foods, id: :uuid do |t|
      t.references :plan_week_day, null: false, foreign_key: true, type: :uuid
      t.references :occasion, null: false, foreign_key: true
      t.references :food, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :plan_week_day_occasion_foods,
              %w[plan_week_day_id occasion_id],
              unique: true,
              name: 'plan_week_day_occasion_foods_unique_index'
  end
end
