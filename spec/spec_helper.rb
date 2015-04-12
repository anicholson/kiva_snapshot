# Always use test environment
ENV['RACK_ENV']      ||= 'test'
ENV['COOKIE_SECRET'] = 'cookie_secret'

# Always see if the db's migrated before we start
require 'sinatra/activerecord'
require 'jdbc-postgresql'

ActiveRecord::Migration.maintain_test_schema!

# Include the app code
require 'rack/test'
require_relative '../boot'

# Keep the db clean
require 'database_cleaner'

# Capybara configuration
require 'capybara'
require 'capybara/poltergeist'

Capybara.app = KivaSnapshotApp
Capybara.javascript_driver = :poltergeist

# RSpec helpers and config

support_files = Pathname.new(__FILE__).join('..', 'support', '**', '*.rb')
Dir.glob(support_files).each do |support_file|
  require support_file
end

RSpec.configure do |config|

  config.include Rack::Test::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end


