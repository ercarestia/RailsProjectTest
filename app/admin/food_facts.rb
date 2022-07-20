# frozen_string_literal: true

ActiveAdmin.register FoodFact do
  menu parent: 'Data', priority: 3
  config.sort_order = 'id_asc'
  permit_params :name, :fact, :data_type
end
