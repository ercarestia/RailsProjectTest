# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-status/web'
require 'sidekiq-scheduler/web'

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Active admin UI /admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user, ->(u) { u.super_admin? } do
    # Sidekiq admin ui
    mount Sidekiq::Web => 'admin/sidekiq'

    # Swagger Docs
    mount Rswag::Ui::Engine => 'admin/swagger'
    mount Rswag::Api::Engine => 'admin/api-docs'

    # Rails performance
    mount RailsPerformance::Engine, at: 'rails/performance' if defined? RailsPerformance
  end

  # Defines the root path route ("/")
  root to: redirect('/admin')
end
