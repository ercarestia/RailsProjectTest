# frozen_string_literal: true

ActiveAdmin.register PlanWeekDayOccasionFood do
  menu parent: 'Data'
  permit_params :plan_week_day_id, :occasion_id, :food_id
end
