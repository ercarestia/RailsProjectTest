# frozen_string_literal: true

# FoodFact model
class FoodFact < ApplicationRecord
  def fetch_fact(food_ids)
    calories_fact(food_ids) if fact == 'calories'
  end

  def calories_fact(food_ids)
    Food.where(id: food_ids).map(&:calories).map(&:to_i).sum
  end
end
