ENV['RACK_ENV'] ||= 'test'

require 'sinatra/activerecord'
require 'jdbc-postgresql'

ActiveRecord::Migration.maintain_test_schema!

%w(clients workers models).each do |dir|
  Dir.glob(Pathname.new(__FILE__).join('..', '..', dir, '**', '*.rb')).each do |file|
    require file
  end
end

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


