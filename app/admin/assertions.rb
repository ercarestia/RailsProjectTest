# frozen_string_literal: true

ActiveAdmin.register Assertion do
  menu parent: 'Data', priority: 3
  permit_params :name, :action
  config.sort_order = 'id_asc'
end
