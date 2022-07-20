# frozen_string_literal: true

ActiveAdmin.register Plan do
  menu parent: 'Planner', priority: 1
  permit_params :name, :order_key, days: [], occasions: []
  config.sort_order = 'order_key_asc'
  json_editor
  index do
    selectable_column
    column :name do |record|
      link_to record.name, resource_path(record)
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :name
      f.input :order_key, input_html: { value: (f.object.persisted? ? f.object.order_key : Plan.count) }

      f.input  :days, as: :select, multiple: true, collection: Day.all
      f.input  :occasions, as: :select, multiple: true, collection: Occasion.all
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  action_item 'Aggregate', only: :show do
    link_to 'Aggregate', touch_admin_plan_path
  end

  member_action 'touch', method: [:get] do
    plan = Plan.find params[:id]
    plan.save!
    redirect_to admin_plan_url
  end

  member_action 'add_week', method: [:get] do
    plan = Plan.find params[:id]
    week = plan.add_week
    render json: { week: week.name.downcase.tr(' ', '-') }
  end

  member_action 'add_food', method: [:get] do
    return if params[:id].blank? || params[:occasion].blank? || params[:food].blank?

    plan = Plan.find params[:id]
    plan&.add_food(params[:occasion], params[:food])
    head :ok
  end

  member_action 'remove_food', method: [:get] do
    plan = Plan.find params[:id]
    plan&.remove_food(params[:occasion])
    head :ok
  end

  member_action 'remove_week', method: [:get] do
    plan = Plan.find params[:id]
    plan.remove_week
    head :ok
  end

  show do
    available_days = Day.where(id: plan.days)
    available_occasions = Occasion.where(id: plan.occasions)
    attributes_table do
      row :name
      row :order_key
      row :legacy_key
      row :days do
        div do
          available_days.each do |day|
            status_tag day.name, class: 'yes'
          end
        end
      end
      row :occasions do
        div do
          available_occasions.each do |occasion|
            status_tag occasion.name, class: 'yes'
          end
        end
      end
      row :created_at
      row :updated_at
    end

    render 'gallery_selector'
    br
    div(class: 'food-selector') do
      tabs do
        plan.aggregate['weeks'].each do |plan_week|
          week_name = plan_week['name']
          tab week_name do
            if plan_week['warnings'].present?
              div class: 'dotted-highlight' do
                span(class: 'tooltip') { fa_icon('exclamation-triangle 2x c-yellow') }
                span(class: 'tooltiptext') do
                  plan_week['warnings'].values.join(', ')
                end
              end
            end
            render "gallery#{"_#{params['size']}" if %w[min sm].include? params['size']}",
                   plan_week:, week_name:, plan:, available_days:, available_occasions:
          end
        end
        tab('+', id: 'add_week') { i(class: 'fa fa-spinner fa-spin fa-3x fa-fw') } if plan.can_add_weeks?
      end
      # render 'warnings'
    end
    render 'json_parser', plan: plan
    active_admin_comments
  end
end
