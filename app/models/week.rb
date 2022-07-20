# frozen_string_literal: true

# Basic Week configuration model
class Week < ApplicationRecord
  self.implicit_order_column = 'order_key'
end
