# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_531_175_152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'role', default: 'config_admin', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'assertions', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'action', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'days', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'order_key', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_key'], name: 'index_days_on_order_key'
  end

  create_table 'food_assertions', force: :cascade do |t|
    t.uuid 'food_id', null: false
    t.bigint 'assertion_id', null: false
    t.string 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['assertion_id'], name: 'index_food_assertions_on_assertion_id'
    t.index %w[food_id assertion_id], name: 'index_food_assertions_on_food_id_and_assertion_id', unique: true
    t.index ['food_id'], name: 'index_food_assertions_on_food_id'
  end

  create_table 'food_facts', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'fact', null: false
    t.string 'data_type', null: false
    t.string 'allowed_values', array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'foods', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'sku', null: false
    t.integer 'product_number', null: false
    t.bigint 'meal_type_id', null: false
    t.integer 'display_order', default: 0, null: false
    t.boolean 'exclude_search', default: false
    t.string 'image_url'
    t.string 'short_description', default: ''
    t.text 'long_description', default: ''
    t.text 'ingredient_label', default: '', null: false
    t.integer 'calories', default: 0, null: false
    t.integer 'calories_from_fat', default: 0, null: false
    t.integer 'total_fat', default: 0, null: false
    t.integer 'saturated_fat', default: 0, null: false
    t.integer 'trans_fat', default: 0, null: false
    t.integer 'cholesterol', default: 0, null: false
    t.integer 'protein', default: 0, null: false
    t.integer 'carbohydrates', default: 0, null: false
    t.integer 'dietary_fiber', default: 0, null: false
    t.integer 'sugars', default: 0, null: false
    t.integer 'sodium', default: 0, null: false
    t.integer 'iron', default: 0, null: false
    t.integer 'calcium', default: 0, null: false
    t.integer 'vitamin_d', default: 0, null: false
    t.integer 'potassium', default: 0, null: false
    t.boolean 'gluten', default: false, null: false
    t.boolean 'featured_meal', default: false, null: false
    t.integer 'added_sugars', default: 0, null: false
    t.boolean 'active', default: true, null: false
    t.boolean 'active_bistromd', default: true
    t.boolean 'active_my_bistro_md', default: true
    t.integer 'active_my_bistromd', default: 1, null: false
    t.boolean 'enabled', default: true, null: false
    t.integer 'deleted', default: 0, null: false
    t.integer 'item_count', default: 0, null: false
    t.integer 'quantity', default: 0, null: false
    t.integer 'quantity_cut_off', default: 0, null: false
    t.integer 'quantity_in_process', default: 0
    t.integer 'quantity_shipped', default: 0
    t.integer 'quantity_alert_level', default: 0, null: false
    t.integer 'quantity_total', default: 0
    t.integer 'quantity_allocated', default: 0
    t.integer 'wh_item_count', default: 0, null: false
    t.integer 'wh_quantity', default: 0
    t.integer 'wh_quantity_cut_off', default: 0, null: false
    t.integer 'wh_quantity_shipped', default: 0, null: false
    t.integer 'wh_quantity_alert_level', default: 0, null: false
    t.integer 'wh_quantity_allocated', default: 0, null: false
    t.integer 'legacy_key'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['meal_type_id'], name: 'index_foods_on_meal_type_id'
  end

  create_table 'meal_types', force: :cascade do |t|
    t.string 'name'
    t.integer 'occasions', default: [], array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'occasions', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'order_key', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_key'], name: 'index_occasions_on_order_key'
  end

  create_table 'plan_food_fact_assertions', force: :cascade do |t|
    t.uuid 'plan_id', null: false
    t.bigint 'food_fact_id', null: false
    t.bigint 'assertion_id', null: false
    t.string 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['assertion_id'], name: 'index_plan_food_fact_assertions_on_assertion_id'
    t.index ['food_fact_id'], name: 'index_plan_food_fact_assertions_on_food_fact_id'
    t.index ['plan_id'], name: 'index_plan_food_fact_assertions_on_plan_id'
  end

  create_table 'plan_week_day_occasion_foods', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'plan_week_day_id', null: false
    t.bigint 'occasion_id', null: false
    t.uuid 'food_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['food_id'], name: 'index_plan_week_day_occasion_foods_on_food_id'
    t.index ['occasion_id'], name: 'index_plan_week_day_occasion_foods_on_occasion_id'
    t.index %w[plan_week_day_id occasion_id], name: 'plan_week_day_occasion_foods_unique_index', unique: true
    t.index ['plan_week_day_id'], name: 'index_plan_week_day_occasion_foods_on_plan_week_day_id'
  end

  create_table 'plan_week_days', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'plan_week_id', null: false
    t.bigint 'day_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['day_id'], name: 'index_plan_week_days_on_day_id'
    t.index %w[plan_week_id day_id], name: 'index_plan_week_days_on_plan_week_id_and_day_id', unique: true
    t.index ['plan_week_id'], name: 'index_plan_week_days_on_plan_week_id'
  end

  create_table 'plan_weeks', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'plan_id', null: false
    t.bigint 'week_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[plan_id week_id], name: 'index_plan_weeks_on_plan_id_and_week_id', unique: true
    t.index ['plan_id'], name: 'index_plan_weeks_on_plan_id'
    t.index ['week_id'], name: 'index_plan_weeks_on_week_id'
  end

  create_table 'plans', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'order_key', default: 0, null: false
    t.integer 'legacy_key'
    t.integer 'days', default: [], array: true
    t.integer 'occasions', default: [], array: true
    t.jsonb 'aggregate', default: {}
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_key'], name: 'index_plans_on_order_key'
  end

  create_table 'weeks', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'order_key', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_key'], name: 'index_weeks_on_order_key'
  end

  add_foreign_key 'food_assertions', 'assertions'
  add_foreign_key 'food_assertions', 'foods'
  add_foreign_key 'foods', 'meal_types'
  add_foreign_key 'plan_food_fact_assertions', 'assertions'
  add_foreign_key 'plan_food_fact_assertions', 'food_facts'
  add_foreign_key 'plan_food_fact_assertions', 'plans'
  add_foreign_key 'plan_week_day_occasion_foods', 'foods'
  add_foreign_key 'plan_week_day_occasion_foods', 'occasions'
  add_foreign_key 'plan_week_day_occasion_foods', 'plan_week_days'
  add_foreign_key 'plan_week_days', 'days'
  add_foreign_key 'plan_week_days', 'plan_weeks'
  add_foreign_key 'plan_weeks', 'plans'
  add_foreign_key 'plan_weeks', 'weeks'
end
