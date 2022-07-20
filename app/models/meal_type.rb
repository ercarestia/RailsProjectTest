# frozen_string_literal: true

# MealType model
class MealType < ApplicationRecord
  self.implicit_order_column = 'id'
  # List included occasion names for this meal type
  def occasion_values
    Occasion.occasions.slice(*occasions).values
  end

  # List included occasions for this meal type
  def occasion_list
    Occasion.find(occasions)
  end

  # List of hashed occasion ids
  def occasion_hash
    occasions.index_with { id }
  end

  # Returns a hashmap of occasion ids => meal type ids
  # { 1: 1, 2: 3, 3: 3, 4: 4, 5: 4, 6: 4 }
  def self.occasion_meals
    @occasion_meals ||= all.map(&:occasion_hash).reduce(:merge)
  end
end
