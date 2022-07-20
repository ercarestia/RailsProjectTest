# frozen_string_literal: true

# Postgres extension to add UUIDs
class EnableUuid < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end
