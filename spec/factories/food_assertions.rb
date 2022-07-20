# frozen_string_literal: true

FactoryBot.define do
  factory :food_assertion do
    food { nil }
    assertion { nil }
    value { 'MyString' }
  end
end
