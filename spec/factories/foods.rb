# frozen_string_literal: true

FactoryBot.define do
  factory :food do
    legacy_key { 1 }
    name { 'MyString' }
    active { false }
    sku { 1 }
    meal_type_key { 'MyString' }
  end
end
