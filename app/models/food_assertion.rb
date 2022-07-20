# frozen_string_literal: true

# FoodAssertion model
class FoodAssertion < ApplicationRecord
  belongs_to :food
  belongs_to :assertion

  def statement
    "#{food&.name} #{assertion&.name} #{value}"
  end

  # Weekly Assertions
  def self.week_le_assertion(food_hash)
    assertions = quantities('week_le')
    food_hash.slice(*assertions.keys).map do |food_id, quantity|
      assertion = assertions[food_id]
      [food_id, assertion.statement] if quantity > assertion.value.to_i
    end.compact.to_h
  end

  # Plan Assertions
  def self.plan_le_assertion
    quantities('plan_le')
  end

  # Memoize Quantities
  def self.quantities(assertion_action)
    @quantities ||= {}
    @quantities[assertion_action] ||= where(
      assertion: Assertion.find_by(action: assertion_action)
    ).index_by(&:food_id)
  end
end
