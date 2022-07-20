# frozen_string_literal: true

ActiveAdmin.register MealType do
  menu parent: 'Planner', priority: 5
  config.sort_order = 'id_asc'

  index do
    selectable_column
    id_column
    column :name do |record|
      link_to record.name, resource_path(record)
    end
    column :occasions do |record|
      record.occasion_list.each do |occasion|
        link_to occasion.name, admin_occasion_path(occasion)
      end
    end

    column :created_at
    column :updated_at
    actions
  end

  show do |meal_type|
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end

    tabs do
      meal_type.occasion_list.each do |occasion|
        tab occasion.name do
          attributes_table_for occasion do
            row :name

            row :created_at
            row :updated_at
          end
          columns class: 'columns' do
            column do
              span link_to 'View', admin_occasion_path(occasion), class: 'button'
              span link_to 'Edit', edit_admin_occasion_path(occasion), class: 'button'
            end
          end
        end
      end
    end
  end
end
