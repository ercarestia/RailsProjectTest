# frozen_string_literal: true

require 'simplecov'
if ENV.fetch('COVERAGE', false)
  SimpleCov.start 'rails' do
    minimum_coverage 0
    maximum_coverage_drop 2
  end
end
