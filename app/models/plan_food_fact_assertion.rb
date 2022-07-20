# frozen_string_literal: true

# PlanFoodFactAssertion model
class PlanFoodFactAssertion < ApplicationRecord
  belongs_to :plan
  belongs_to :food_fact
  belongs_to :assertion
  after_commit do
    plan.save!
  end

  def statement
    "#{plan&.name} #{assertion&.name} #{value} for #{food_fact&.name}"
  end

  # Daily Assertions
  def self.day_le_assertion(day, food_ids)
    assertions = assertion_list(day.plan_week.plan, 'day_le')
    assertions.map do |assertion|
      [day.id, assertion.statement] if assertion.food_fact.fetch_fact(food_ids) > assertion.value.to_i
    end.compact.to_h
  end

  # Weekly Assertions
  def self.week_le_assertion(plan, _food_hash)
    assertion_list(plan, 'plan_le')
  end

  # Plan Assertions
  def self.plan_le_assertion(plan, _food_hash)
    assertion_list(plan, 'plan_le')
  end

  # Memoize Quantities
  def self.assertion_list(plan, assertion_action)
    where(
      plan:,
      assertion: Assertion.find_by(action: assertion_action)
    )
  end
end
