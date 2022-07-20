# frozen_string_literal: true

ActiveAdmin.register PlanWeek do
  menu parent: 'Data'
  permit_params :plan_id, :week_id
end
