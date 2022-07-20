# frozen_string_literal: true

ActiveAdmin.register Occasion do
  menu parent: 'Planner', priority: 4
  permit_params :name, :order_key
  config.sort_order = 'order_key_asc'

  index do
    selectable_column
    id_column
    column :name do |record|
      link_to record.name, resource_path(record)
    end
    column :order_key
    column :created_at
    column :updated_at
    actions
  end
end
