# frozen_string_literal: true

# Serializer for PlanWeekDayOccasionFood Model
class PlanWeekDayOccasionFoodSerializer < Panko::Serializer
  attributes :id, :name
  delegate :name, to: :object
  has_one :food, serializer: FoodSerializer
end
