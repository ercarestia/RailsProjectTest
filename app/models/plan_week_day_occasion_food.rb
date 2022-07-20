# frozen_string_literal: true

# Occasion model for weekly days of a plan
class PlanWeekDayOccasionFood < ApplicationRecord
  self.implicit_order_column = 'occasion_id'

  belongs_to :plan_week_day
  belongs_to :occasion
  belongs_to :food, optional: true
  delegate :name, to: :occasion
end
