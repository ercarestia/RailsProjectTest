# frozen_string_literal: true

# Food model
class Food < ApplicationRecord
  belongs_to :meal_type
  has_many :food_assertions, dependent: :destroy

  def server_image_url
    image_url || "https://bistromd.sirv.com/Images/meal/#{legacy_key}/Large.jpg"
  end

  def server_fault_image_url
    "https://mp.bistromd.com/Images/meal/#{legacy_key}/Large.jpg"
  end
end
