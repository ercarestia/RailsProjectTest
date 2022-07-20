# frozen_string_literal: true

require 'database_cleaner/active_record'
# This guard is to avoid accidental database truncations
# Important to add any or every allowedlist here
DatabaseCleaner.url_allowlist = ['postgres://dev:password@db', 'postgres://rails:password@localhost:5432/rails_test']
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
end
