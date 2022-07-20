# frozen_string_literal: true

# Admin user for activeadmin
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable
  enum :role, { super_admin: 'super_admin', config_admin: 'config_admin', inactive: 'inactive' }
end
