# frozen_string_literal: true

ActiveAdmin.register Day do
  menu parent: 'Data', priority: 3
  permit_params :name, :order_key
  config.sort_order = 'order_key_asc'
  index do
    selectable_column
    column :name do |record|
      link_to record.name, resource_path(record)
    end
    column :created_at
    column :updated_at
    actions
  end
end
