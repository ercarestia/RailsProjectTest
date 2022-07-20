# frozen_string_literal: true

FactoryBot.define do
  factory :food_fact do
    name { 'MyString' }
    fact { 'MyString' }
    data_type { 'MyString' }
    allowed_values { 'MyString' }
  end
end
