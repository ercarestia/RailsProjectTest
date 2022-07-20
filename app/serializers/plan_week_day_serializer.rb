# frozen_string_literal: true

# Serializer for PlanWeekDay Model
class PlanWeekDaySerializer < Panko::Serializer
  attributes :id, :name, :warnings
  delegate :name, to: :object
  has_many :occasions, each_serializer: PlanWeekDayOccasionFoodSerializer

  def warnings
    PlanFoodFactAssertion.day_le_assertion(object, object.food_ids)
  end
end
