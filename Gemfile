# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.2', '>= 7.0.2.4'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Serializer for Rails
gem 'panko_serializer'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'
gem 'terser'

# Sentry SDK
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sentry-sidekiq'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :integration, :staging, :production do
  # Monitor performance
  gem 'rails_performance'
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.1'

  # Test Coverage
  gem 'simplecov', require: false

  # Lint and code guidelines
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'fasterer'
  gem 'overcommit'
  gem 'pronto'
  gem 'pronto-flay', require: false
  gem 'pronto-rubocop', require: false
  gem 'rails_best_practices'
  gem 'reek'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rubocop-rspec'

  # Code debug
  gem 'pry'
  # gem 'debase', '~> 0.2.2.beta2', require: false
  # gem 'ruby-debug-ide'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem 'web-console'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

# Admin interface
gem 'activeadmin', '~> 2.12'
gem 'activeadmin_json_editor'
gem 'active_admin_theme'
gem 'cancancan'
gem 'font-awesome-rails', github: 'bokmann/font-awesome-rails', branch: 'master'
gem 'select2-rails'
gem 'sweetalert2'

# Authentication
gem 'devise', '~> 4.8'

# Background jobs
gem 'sidekiq', '~> 6.4'
gem 'sidekiq-scheduler'
gem 'sidekiq-status'

# Doc generation
gem 'rswag', '~> 2.5'
