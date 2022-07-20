# frozen_string_literal: true

FactoryBot.define do
  factory :plan_food_fact_assertion do
    plan { nil }
    food_fact { nil }
    assertion { nil }
    value { 'MyString' }
  end
end
