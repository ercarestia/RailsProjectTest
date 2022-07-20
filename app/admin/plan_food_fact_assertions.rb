# frozen_string_literal: true

ActiveAdmin.register PlanFoodFactAssertion do
  menu parent: 'Data', priority: 3
  permit_params :plan_id, :assertion_id, :food_fact_id, :value
  config.sort_order = 'id_asc'
end
