# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  menu parent: 'Admin', priority: 1
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :role, &:role_before_type_cast
    column :sign_in_count
    column :created_at

    actions defaults: true do |usr|
      item 'Role', edit_admin_admin_user_path(usr, role: true) if current_admin_user.super_admin?
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      if params[:role].blank?
        f.input :password
        f.input :password_confirmation
      end
      f.input :role, as: :select, collection: AdminUser.roles.keys if !f.object.persisted? || params[:role].present?
    end
    f.actions
  end
end
