# frozen_string_literal: true

require 'rails_helper'

describe AdminUser, type: :model do
  it 'is invalid with empty attributes' do
    expect(AdminUser.new).to be_invalid
  end
  it 'is not valid without an email' do
    admin_user = AdminUser.new(email: nil)
    expect(admin_user).to_not be_valid
  end
  it 'is not valid without a password' do
    admin_user = AdminUser.new(email: 'test@test.com', password: nil)
    expect(admin_user).to_not be_valid
  end
  it 'is not valid without a password confirmation' do
    admin_user = AdminUser.new(email: 'test@test.com', password: 'test', password_confirmation: 'test')
    expect(admin_user).to_not be_valid
  end
end
