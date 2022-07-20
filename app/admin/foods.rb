# frozen_string_literal: true

ActiveAdmin.register Food do
  menu parent: 'Planner', priority: 2
  permit_params :name, :active, :sku, :meal_type_key, :short_description,
                :long_description, :calories, :image_url, :exclude_search, :meal_type_id, :sku,
                :calories_from_fat, :total_fat, :saturated_fat, :trans_fat, :deleted,
                :cholesterol, :protein, :carbohydrates, :dietary_fiber, :sugars, :sodium,
                :enabled, :quantity, :cut_off_quantity, :in_process_quantity, :shipped_quantity,
                :alert_level_quantity, :item_count, :deleted, :product_number, :quantity_allocated,
                :active_bistromd, :display_order, :quantity_total, :quantity_in_process, :gluten,
                :active_my_bistro_md, :ingredient_label, :total_quantity, :wh_quantity, :wh_cut_off_quantity,
                :wh_quantity_shipped, :wh_alert_level_quantity, :wh_item_count, :wh_allocated_quantity,
                :allocated_quantity, :active_my_bistromd, :featured_meal, :added_sugars, :iron, :calcium,
                :vitamin_d, :potassium, :quantity_shipped, :legacy_key
  index do
    selectable_column
    column :name do |record|
      link_to record.name, resource_path(record)
    end
    column :sku
    column :active
    column :meal_type
    column :calories

    column :created_at
    column :updated_at
    actions
  end

  action_item 'edit limit', only: :show do
    food = Food.find(params[:id])
    link_to 'Edit Limits', admin_food_assertions_path(q: { food_id_eq: food.id }) if food.food_assertions.present?
  end

  show do |food|
    if food.food_assertions.present?
      div class: 'dotted-highlight' do
        span "This product #{food.food_assertions.map do |rule|
                               "#{rule.assertion.name} #{rule.value}"
                             end.join(' and ')}"
        span link_to('Edit Limits', admin_food_assertions_path(q: { food_id_eq: food.id }), class: 'pull-right')
      end
    end
    attributes_table do
      row :name
      row :sku
      row :product_number
      row :legacy_key
      row :meal_type
      row :display_order
      row :short_description
      row :long_description
      row :ingredient_label
    end
    panel 'Active Info' do
      attributes_table_for food do
        row :active
        row :active_bistromd
        row :active_my_bistro_md
        row :active_my_bistromd
        row :enabled
        row :deleted
      end
    end

    panel 'Quanity Info' do
      attributes_table_for food do
        row :item_count
        row :quantity
        row :quantity_cut_off
        row :quantity_in_process
        row :quantity_shipped
        row :quantity_alert_level
        row :quantity_total
        row :quantity_allocated

        row :wh_item_count
        row :wh_quantity
        row :wh_quantity_cut_off
        row :wh_quantity_shipped
        row :wh_quantity_alert_level
        row :wh_quantity_allocated
      end
    end
  end

  sidebar 'Nutrients', partial: 'nutrionix', only: :show

  sidebar 'Macro Nutrients', only: :show do
    food = Food.find params[:id]
    attributes_table_for food do
      row :calories
      row :calories_from_fat
      row :saturated_fat
      row :trans_fat
      row :total_fat
      row :cholesterol
      row :carbohydrates
      row :dietary_fiber
      row :protein
      row :sugars
      row :sodium
      row :iron
      row :calcium
      row :potassium
      row :vitamin_d
    end
  end
  sidebar 'Additional Nutrient Info', only: :show do
    food = Food.find params[:id]
    attributes_table_for food do
      row :gluten
      row :featured_meal
      row :added_sugars
    end
  end
end
