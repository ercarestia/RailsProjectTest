# frozen_string_literal: true

# PlanWeekDay model for weekly days of a plan
class PlanWeekDay < ApplicationRecord
  self.implicit_order_column = 'day_id'
  belongs_to :plan_week
  belongs_to :day
  has_many :plan_week_day_occasion_foods,
           -> { order(occasion_id: :asc) },
           dependent: :destroy,
           inverse_of: :plan_week_day

  after_create do
    plan_week_day_occasion_foods.create!(Occasion.all.map { |occasion| { occasion: } })
  end

  delegate :name, to: :day
  def food_ids
    plan_week_day_occasion_foods.pluck(:food_id)
  end

  def occasions
    plan_week_day_occasion_foods.where(occasions: plan_week.plan.occasions)
  end
end
