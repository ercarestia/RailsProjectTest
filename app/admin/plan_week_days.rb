# frozen_string_literal: true

ActiveAdmin.register PlanWeekDay do
  menu parent: 'Data'
  permit_params :plan_week_id, :day_id
end
