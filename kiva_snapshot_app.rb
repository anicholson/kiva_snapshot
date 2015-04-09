require 'sinatra/reloader'
require 'sinatra/namespace'
require 'sinatra/json'
require 'sinatra/asset_pipeline'
require 'sinatra/activerecord'
require 'activerecord-jdbc-adapter'
require 'slim'
require 'jdbc-postgresql'

require 'oauth2'

require_relative 'routes/api'
require_relative 'routes/application'


class KivaSnapshotApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace

  configure :development do
    require 'dotenv'
    register Sinatra::Reloader

    Dotenv.load
  end

  set :root,              File.dirname(__FILE__)
  set :database_file,     'config/database.yml'
  set :sprockets,         Sprockets::Environment.new(root)
  set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  configure do
    mime_type :woff2, 'application/font-woff2'
  end

  use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET']
  register Sinatra::AssetPipeline

  register Routing::API
  register Routing::Application
end
