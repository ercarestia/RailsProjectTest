# frozen_string_literal: true

# PlanWeek model for weekly days of a plan
class PlanWeek < ApplicationRecord
  self.implicit_order_column = 'week_id'
  belongs_to :plan
  belongs_to :week

  has_many :plan_week_days,
           -> { order(day_id: :asc) },
           dependent: :destroy,
           inverse_of: :plan_week

  after_create do
    plan_week_days.create!(Day.all.map { |day| { day: } })
  end

  delegate :name, to: :week

  def food_ids
    @food_ids ||= plan_week_days.map(&:food_ids).flatten
  end

  def food_counts
    food_ids.group_by(&:itself).transform_values(&:size)
  end

  def days
    plan_week_days.where(days: plan.days)
  end
end
