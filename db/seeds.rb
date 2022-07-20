# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development? || Rails.env.integration?
  Rails.logger.info { "Seeding Environment.. #{Rails.env} " }
  unless AdminUser.exists?(email: 'admin@example.com')
    AdminUser.create!(
      email: 'admin@example.com', password: 'password',
      password_confirmation: 'password', role: 'super_admin'
    )
  end

  Dir.glob(Rails.root.join('db/data/*')).map do |file|
    table_name = file.match(/\d.(?<table>.+).csv/).try(:[], :table)
    Rails.logger.info { "Loading.. #{file} " }
    next unless table_name

    table = table_name.classify.constantize
    next unless table.try :table_exists?

    Rails.logger.info { "Truncating table.. #{table}" }
    table.delete_all
    data = CSV.read(file, headers: true).map(&:to_h)
    # rubocop:disable Rails::SkipsModelValidations
    table.insert_all! data
    # rubocop:enable Rails::SkipsModelValidations

    # Automatically reset sequences after restore for integer id tables
    ActiveRecord::Base.connection.reset_pk_sequence!(table_name) if begin
      !Integer(data[0]['id']).nil?
    rescue StandardError
      false
    end
  end

  Plan.all.map(&:touch)
end
