# frozen_string_literal: true

# Serializer for Food Model
class FoodSerializer < Panko::Serializer
  attributes :id, :name, :calories, :exclude_search, :server_image_url, :server_fault_image_url

  delegate :server_image_url, to: :object
  delegate :server_fault_image_url, to: :object
end
