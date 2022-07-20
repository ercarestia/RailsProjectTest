# frozen_string_literal: true

# Serializer for PlanWeek Model
class PlanWeekSerializer < Panko::Serializer
  attributes :name, :warnings, :plan_week_days
  delegate :name, to: :object
  has_many :days, each_serializer: PlanWeekDaySerializer

  def warnings
    FoodAssertion.week_le_assertion(object.food_counts)
  end
end
