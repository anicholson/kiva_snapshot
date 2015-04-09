ENV['RACK_ENV'] ||= 'test'

require 'sinatra/activerecord'
require 'jdbc-postgresql'

ActiveRecord::Migration.maintain_test_schema!

# Include the app code
require_relative '../boot'

require 'database_cleaner'

RSpec.configure do |config|

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


