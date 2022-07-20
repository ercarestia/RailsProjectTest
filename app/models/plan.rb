# frozen_string_literal: true

# Basic Plan configuration model
class Plan < ApplicationRecord
  self.implicit_order_column = 'order_key'

  after_create :add_week
  after_commit :generate_aggregate
  has_many :plan_weeks,
           -> { order(week_id: :asc) },
           dependent: :destroy,
           inverse_of: :plan
  has_many :weeks, through: :plan_weeks

  # Add a new week to a plan
  def add_week
    week = Week.find(plan_weeks.count + 1)
    plan_weeks.create!(week:) && generate_aggregate
    week
  end

  # Add food to a plan occasion
  def add_food(occasion_id, food_id)
    food = Food.find(food_id)
    occasion = PlanWeekDayOccasionFood.find_by(
      plan_week_day: PlanWeekDay.where(plan_week: plan_weeks),
      id: occasion_id
    )
    occasion&.update(food:) && generate_aggregate
  end

  # Remove food of a plan occasion
  def remove_food(occasion_id)
    occasion = PlanWeekDayOccasionFood.find_by(
      plan_week_day: PlanWeekDay.where(plan_week: plan_weeks),
      id: occasion_id
    )
    occasion.update(food: nil) & generate_aggregate if occasion
  end

  # removes latest week
  def remove_week
    plan_weeks.last.destroy && generate_aggregate
  end

  # Check if there are more weeks that can be added
  def can_add_weeks?
    plan_weeks.count < Week.count
  end

  private

  # Adds a basic aggregate JSON structure
  def generate_aggregate
    # rubocop:disable Rails::SkipsModelValidations
    update_column :aggregate, PlanSerializer.new.serialize(self)
    # rubocop:enable Rails::SkipsModelValidations
  end
end
