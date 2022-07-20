# frozen_string_literal: true

# Create table for foods table
class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods, id: :uuid do |t|
      t.string :name, null: false
      t.integer :sku, null: false
      t.integer :product_number, null: false
      t.references :meal_type, null: false, foreign_key: true
      # ordering
      t.integer :display_order, null: false, default: 0

      # is this searchable?
      t.boolean :exclude_search, default: false

      # Contains a selectable image
      t.string :image_url

      # Description
      t.string :short_description, null: true, default: '' # Just to be able to Seed Data, Temporary....
      t.text :long_description, null: true, default: '' # Just to be able to Seed Data, Temporary....
      t.text :ingredient_label, null: false, default: ''

      # Macro nutrients
      t.integer :calories, null: false, default: 0
      t.integer :calories_from_fat, null: false, default: 0
      t.integer :total_fat, null: false, default: 0
      t.integer :saturated_fat, null: false, default: 0
      t.integer :trans_fat, null: false, default: 0
      t.integer :cholesterol, null: false, default: 0
      t.integer :protein, null: false, default: 0
      t.integer :carbohydrates, null: false, default: 0
      t.integer :dietary_fiber, null: false, default: 0
      t.integer :sugars, null: false, default: 0
      t.integer :sodium, null: false, default: 0
      t.integer :iron, null: false, default: 0
      t.integer :calcium, null: false, default: 0
      t.integer :vitamin_d, null: false, default: 0
      t.integer :potassium, null: false, default: 0

      # additional attributes
      t.boolean :gluten, null: false, default: 0
      t.boolean :featured_meal, null: false, default: 0
      t.integer :added_sugars, null: false, default: 0

      # active
      t.boolean :active, null: false, default: true
      t.boolean :active_bistromd, null: true, default: true # Just to be able to Seed Data, Temporary....
      t.boolean :active_my_bistro_md, null: true, default: true # Just to be able to Seed Data, Temporary....
      t.integer :active_my_bistromd, null: false, default: true

      t.boolean :enabled, null: false, default: true
      t.integer :deleted, null: false, default: false

      # quantity
      t.integer :item_count, null: false, default: 0
      t.integer :quantity, null: false, default: 0
      t.integer :quantity_cut_off, null: false, default: 0
      t.integer :quantity_in_process, null: true, default: 0 # Just to be able to Seed Data, Temporary....
      t.integer :quantity_shipped, null: true, default: 0 # Just to be able to Seed Data, Temporary....
      t.integer :quantity_alert_level, null: false, default: 0
      t.integer :quantity_total, null: true, default: 0 # Just to be able to Seed Data, Temporary....
      t.integer :quantity_allocated, null: true, default: 0 # Just to be able to Seed Data, Temporary....

      # wh quantity
      t.integer :wh_item_count, null: false, default: 0
      t.integer :wh_quantity, null: true, default: 0 # Just to be able to Seed Data, Temporary....
      t.integer :wh_quantity_cut_off, null: false, default: 0
      t.integer :wh_quantity_shipped, null: false, default: 0
      t.integer :wh_quantity_alert_level, null: false, default: 0
      t.integer :wh_quantity_allocated, null: false, default: 0
      t.integer :legacy_key

      # timestamps
      t.timestamps
    end
  end
end
