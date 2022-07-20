# frozen_string_literal: true

# Day model
class Day < ApplicationRecord
  self.implicit_order_column = 'order_key'
end
