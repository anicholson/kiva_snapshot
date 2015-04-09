source "https://rubygems.org"

ruby '1.9.3', engine: 'jruby', engine_version: '1.7.19'


# Platform
gem 'rake'
gem 'dotenv'
gem 'pry'

group :development, :test do

  # Testing and debugging
  gem 'rspec', '~> 3.0'

  gem 'database_cleaner'
  gem 'capybara'
  gem 'poltergeist'
end

# Server
gem 'rack'
gem 'puma', '2.11.1'

# Web server
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-asset-pipeline'
gem 'sinatra-contrib', require: false

# Assets
gem 'slim'
gem 'sass'

# Database
gem 'sinatra-activerecord'
gem 'activerecord', '~> 4.2'
gem 'activerecord-jdbc-adapter'
gem 'activerecord-jdbcpostgresql-adapter'
gem 'jdbc-postgresql'

# External Services
gem 'faraday'
gem 'faraday_middleware'
gem 'simple_oauth'
gem 'oauth'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-facebook'
