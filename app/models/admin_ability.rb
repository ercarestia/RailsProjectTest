# frozen_string_literal: true

# Add permissions for administrators
class AdminAbility
  include CanCan::Ability
  ADMIN_RESOURCES = [AdminUser, ActiveAdmin::Comment].freeze
  ADMIN_PAGES = ['Tools', 'Swagger Docs', 'Sidekiq Interface'].freeze

  CONFIG_RESOURCES = [].freeze
  CONFIG_PAGES = [].freeze

  # Initialize permissions for administrators
  def initialize(admin_user)
    cannot :read, :all # default to no reads
    return if admin_user.blank?

    alias_action :create, :read, :update, :destroy, to: :crud
    if admin_user.super_admin?
      can :manage, :all
    elsif admin_user.config_admin?
      add_config_role
    end
  end

  # List of config user rules
  def add_config_role
    # Resource access
    can :read, :all
    can :manage, CONFIG_RESOURCES
    # Page access
    cannot :read, ActiveAdmin::Page, name: ADMIN_PAGES
    can :manage, ActiveAdmin::Page, name: CONFIG_PAGES
  end
end
