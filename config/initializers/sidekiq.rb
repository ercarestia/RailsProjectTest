# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-scheduler'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { 'redis://redis:6379/1' } }
  # more documentation here https://github.com/moove-it/sidekiq-scheduler
  # config.on(:startup) do
  #   Sidekiq.schedule = YAML.load_file(File.expand_path('../sidekiq_scheduler.yml', __dir__))
  #   SidekiqScheduler::Scheduler.instance.reload_schedule!
  # end
  # accepts :expiration (optional)
  Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes

  # accepts :expiration (optional)
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { 'redis://redis:6379/1' } }
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
end
