# frozen_string_literal: true

ActiveAdmin.register FoodAssertion do
  menu parent: 'Data', priority: 3
  permit_params :assertion_id, :food_id, :value
  config.sort_order = 'id_asc'
end
