# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { 'test@test.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { 'super_admin' }
  end
end
