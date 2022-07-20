# frozen_string_literal: true

# Serializer for Plan Model
class PlanSerializer < Panko::Serializer
  attributes :name
  has_many :plan_weeks, each_serializer: PlanWeekSerializer, name: :weeks
end
