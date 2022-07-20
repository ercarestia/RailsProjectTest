# frozen_string_literal: true

# Occasion model
class Occasion < ApplicationRecord
  self.implicit_order_column = 'order_key'

  # Memoize Hash with occasions - key(id), value(name)
  def self.occasions
    @occasions ||= pluck(:id, :name).to_h
  end
end
